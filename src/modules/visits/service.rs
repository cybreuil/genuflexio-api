use chrono::{Duration, Utc};
use sqlx::PgPool;

use crate::core::error::ApiError;
use crate::core::pagination::{Paginated, Pagination};

use super::dto::{Visit, VisitMeta, VisitPayload, VisitStats, VisitsRange};
use super::repo::{self, NewVisit};

/// Window used to decide whether an IP is a "new visitor".
const NEW_VISITOR_WINDOW_DAYS: i64 = 30;
const MAX_FIELD_LEN: usize = 512;
const TOP_N: i64 = 10;

// ── Write ─────────────────────────────────────────────────────────────────────

pub async fn record_visit(
    pool: &PgPool,
    payload: VisitPayload,
    meta: VisitMeta,
) -> Result<(), ApiError> {
    let path = truncate(&payload.path, MAX_FIELD_LEN);
    if path.is_empty() || !path.starts_with('/') {
        return Err(ApiError::BadRequest("path must start with '/'".into()));
    }
    // Server-side guard mirroring the front: never count our own admin traffic.
    if path.starts_with("/admin") {
        return Ok(());
    }

    let ua = meta.user_agent.as_deref().unwrap_or("");
    let (device, browser, os) = parse_user_agent(ua, payload.screen_width);

    let since = Utc::now() - Duration::days(NEW_VISITOR_WINDOW_DAYS);
    let is_new_visitor = !repo::ip_seen_since(pool, &meta.ip, since).await?;

    let visit = NewVisit {
        ip: meta.ip,
        country_code: meta
            .country_code
            .map(|c| c.to_ascii_uppercase())
            .filter(|c| c.len() == 2 && c != "XX"),
        country_name: None,
        city: None,
        device,
        browser,
        os,
        user_agent: meta.user_agent.map(|u| truncate(&u, MAX_FIELD_LEN)),
        path,
        referrer: non_empty(truncate(&payload.referrer, MAX_FIELD_LEN)),
        language: non_empty(truncate(&payload.language, 16)),
        timezone: non_empty(truncate(&payload.timezone, 64)),
        screen_width: payload
            .screen_width
            .filter(|w| (1..=i16::MAX as i32).contains(w))
            .map(|w| w as i16),
        theme: non_empty(truncate(&payload.theme, 32)),
        is_new_visitor,
    };

    repo::insert_visit(pool, visit).await
}

// ── Read (admin) ──────────────────────────────────────────────────────────────

pub async fn list_visits(
    pool: &PgPool,
    page: Option<i32>,
    per_page: Option<i32>,
    range: VisitsRange,
) -> Result<Paginated<Visit>, ApiError> {
    let p = Pagination::new(page, per_page);
    let days = range.days();

    let total = repo::count_visits(pool, days).await? as i32;
    if total == 0 {
        return Ok(Paginated::empty(&p));
    }
    if p.beyond_total(total) {
        return Err(ApiError::UnprocessableEntity(format!(
            "Page {} is out of range. Total pages: {}",
            p.page,
            p.total_pages(total)
        )));
    }

    let data = repo::list_visits(pool, days, p.per_page, p.offset).await?;
    Ok(Paginated::new(&p, total, data))
}

pub async fn get_stats(pool: &PgPool, range: VisitsRange) -> Result<VisitStats, ApiError> {
    let days = range.days();

    let (
        totals,
        daily,
        top_countries,
        top_devices,
        top_browsers,
        top_referrers,
        top_languages,
        top_paths,
    ) = tokio::try_join!(
        repo::totals(pool, days),
        repo::daily_counts(pool, days),
        repo::top_countries(pool, days, TOP_N),
        repo::top_by_column(pool, "device", days, TOP_N),
        repo::top_by_column(pool, "browser", days, TOP_N),
        repo::top_by_column(pool, "referrer", days, TOP_N),
        repo::top_by_column(pool, "language", days, TOP_N),
        repo::top_by_column(pool, "path", days, TOP_N),
    )?;

    let new_visitors_ratio = if totals.total_visits > 0 {
        totals.new_visitors as f64 / totals.total_visits as f64
    } else {
        0.0
    };

    Ok(VisitStats {
        range,
        total_visits: totals.total_visits,
        unique_visitors: totals.unique_visitors,
        visits_today: totals.visits_today,
        visits_yesterday: totals.visits_yesterday,
        countries_count: totals.countries_count,
        new_visitors_ratio,
        daily,
        top_countries,
        top_devices,
        top_browsers,
        top_referrers,
        top_languages,
        top_paths,
    })
}

// ── Helpers ───────────────────────────────────────────────────────────────────

fn truncate(s: &str, max: usize) -> String {
    let s = s.trim();
    match s.char_indices().nth(max) {
        Some((idx, _)) => s[..idx].to_owned(),
        None => s.to_owned(),
    }
}

fn non_empty(s: String) -> Option<String> {
    if s.is_empty() {
        None
    } else {
        Some(s)
    }
}

/// Minimal User-Agent sniffing: enough for a dashboard, no external crate.
/// Returns `(device, browser, os)`.
fn parse_user_agent(
    ua: &str,
    screen_width: Option<i32>,
) -> (String, Option<String>, Option<String>) {
    let lower = ua.to_ascii_lowercase();

    let os = if lower.contains("iphone") || lower.contains("ipad") {
        Some("iOS")
    } else if lower.contains("android") {
        Some("Android")
    } else if lower.contains("windows") {
        Some("Windows")
    } else if lower.contains("mac os") || lower.contains("macintosh") {
        Some("macOS")
    } else if lower.contains("cros") {
        Some("ChromeOS")
    } else if lower.contains("linux") {
        Some("Linux")
    } else {
        None
    };

    // Order matters: many browsers embed "chrome" / "safari" in their UA.
    let browser = if lower.contains("edg/") {
        Some("Edge")
    } else if lower.contains("opr/") || lower.contains("opera") {
        Some("Opera")
    } else if lower.contains("samsungbrowser") {
        Some("Samsung Internet")
    } else if lower.contains("firefox/") || lower.contains("fxios") {
        Some("Firefox")
    } else if lower.contains("chrome/") || lower.contains("crios") {
        Some("Chrome")
    } else if lower.contains("safari/") {
        Some("Safari")
    } else if ua.is_empty() {
        None
    } else {
        Some("Other")
    };

    let device = if lower.contains("ipad") || lower.contains("tablet") {
        "tablet"
    } else if lower.contains("mobi") || lower.contains("iphone") || lower.contains("android") {
        "mobile"
    } else if os.is_some() {
        "desktop"
    } else {
        // No usable UA: fall back on the viewport width reported by the front.
        match screen_width {
            Some(w) if w < 768 => "mobile",
            Some(w) if w < 1024 => "tablet",
            Some(_) => "desktop",
            None => "unknown",
        }
    };

    (
        device.to_owned(),
        browser.map(str::to_owned),
        os.map(str::to_owned),
    )
}
