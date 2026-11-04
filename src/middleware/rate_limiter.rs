use actix_web::{
    body::{BoxBody, MessageBody},
    dev::{Service, ServiceRequest, ServiceResponse, Transform},
    Error, HttpResponse,
};
use serde_json::json;
use std::{
    collections::HashMap,
    future::{ready, Ready},
    pin::Pin,
    sync::Arc,
    task::{Context, Poll},
    time::{Duration, Instant},
};
use tokio::sync::Mutex;
use tracing::warn;

/// Above this many tracked IPs, idle buckets are evicted on the next request.
/// Each entry is ~100 bytes, so 10k entries ≈ 1 MB worst case.
const EVICT_THRESHOLD: usize = 10_000;

/// Simple in-memory per-IP token-bucket rate limiter.
/// Good for single-process (NanoPi) setups.
///
/// Create instances *outside* `HttpServer::new` and `.clone()` them inside,
/// otherwise each worker gets its own store and the effective limit is
/// multiplied by the number of workers.
#[derive(Clone)]
pub struct RateLimiter {
    max_requests: u32,
    window: Duration,
    store: Arc<Mutex<HashMap<String, TokenBucket>>>,
}

#[derive(Debug)]
struct TokenBucket {
    tokens: f64,
    last: Instant,
}

impl RateLimiter {
    /// max_requests per window (eg 60 per 60s)
    pub fn new(max_requests: u32, window: Duration) -> Self {
        Self {
            max_requests,
            window,
            store: Arc::new(Mutex::new(HashMap::new())),
        }
    }

    /// Slow-refill daily quota (eg 1000 per 24h).
    pub fn per_day(max_requests: u32) -> Self {
        Self::new(max_requests, Duration::from_secs(24 * 60 * 60))
    }
}

impl<S, B> Transform<S, ServiceRequest> for RateLimiter
where
    S: Service<ServiceRequest, Response = ServiceResponse<B>, Error = Error> + 'static,
    B: MessageBody + 'static,
{
    type Response = ServiceResponse<BoxBody>;
    type Error = Error;
    type InitError = ();
    type Transform = RateLimiterMiddleware<S>;
    type Future = Ready<Result<Self::Transform, Self::InitError>>;

    fn new_transform(&self, service: S) -> Self::Future {
        ready(Ok(RateLimiterMiddleware {
            service: Arc::new(service),
            max_requests: self.max_requests,
            window: self.window,
            store: self.store.clone(),
        }))
    }
}

pub struct RateLimiterMiddleware<S> {
    service: Arc<S>,
    max_requests: u32,
    window: Duration,
    store: Arc<Mutex<HashMap<String, TokenBucket>>>,
}

impl<S, B> Service<ServiceRequest> for RateLimiterMiddleware<S>
where
    S: Service<ServiceRequest, Response = ServiceResponse<B>, Error = Error> + 'static,
    B: MessageBody + 'static,
{
    type Response = ServiceResponse<BoxBody>;
    type Error = Error;
    type Future =
        Pin<Box<dyn std::future::Future<Output = Result<Self::Response, Self::Error>> + 'static>>;

    fn poll_ready(&self, cx: &mut Context<'_>) -> Poll<Result<(), Self::Error>> {
        self.service.poll_ready(cx)
    }

    fn call(&self, req: ServiceRequest) -> Self::Future {
        let svc = self.service.clone();
        let store = self.store.clone();
        let max = self.max_requests;
        let window = self.window;

        Box::pin(async move {
            // Trusts X-Forwarded-For / Forwarded: only valid when the API is
            // reachable solely through a reverse proxy that overwrites them.
            let client_key = req
                .connection_info()
                .realip_remote_addr()
                .map(|s| s.to_string())
                .unwrap_or_else(|| "unknown".to_string());

            let now = Instant::now();
            let max_f = max as f64;
            let rate = max_f / window.as_secs_f64().max(1.0);

            {
                let mut map = store.lock().await;

                // Evict buckets idle for ≥ one window: they are full again,
                // so a fresh entry would be identical. Amortised O(1).
                if map.len() >= EVICT_THRESHOLD {
                    map.retain(|_, b| now.duration_since(b.last) < window);
                }

                let bucket = map.entry(client_key.clone()).or_insert(TokenBucket {
                    tokens: max_f,
                    last: now,
                });

                let elapsed = now.duration_since(bucket.last).as_secs_f64();
                bucket.tokens = (bucket.tokens + elapsed * rate).min(max_f);
                bucket.last = now;

                if bucket.tokens < 1.0 {
                    // Seconds until one token is refilled, not the whole window.
                    let retry_after = ((1.0 - bucket.tokens) / rate).ceil().max(1.0) as u64;
                    warn!("Rate limit exceeded for {client_key} (retry in {retry_after}s)");
                    let resp = HttpResponse::TooManyRequests()
                        .append_header(("Retry-After", retry_after.to_string()))
                        .json(json!({ "error": "Too many requests" }));
                    return Ok(req.into_response(resp).map_into_boxed_body());
                }

                bucket.tokens -= 1.0;
            }

            let res = svc.call(req).await?;
            Ok(res.map_into_boxed_body())
        })
    }
}
