mod core;
mod middleware;
mod modules;

use actix_web::{middleware::Logger, web, App, HttpServer, ResponseError};
use core::{error, router::router};
use dotenv::dotenv;
use middleware::cors::cors;
use middleware::rate_limiter::RateLimiter;
use std::time::Duration;
use tracing_subscriber::{fmt, EnvFilter};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    // Panic if .env file is missing, because we need it for the database URL and other config
    dotenv().expect(".env file missing");

    fmt().with_env_filter(EnvFilter::from_default_env()).init();

    let cfg = core::config::Config::from_env();
    let pool = core::db::create_pool(&cfg.database_url).await;
    let cfg_data = web::Data::new(cfg.clone());
    let pool_data = web::Data::new(pool);

    // Rate Limits
    let daily_rl = RateLimiter::per_day(1000); // 1000 req/day per IP
    let global_rl = RateLimiter::new(300, Duration::from_secs(60)); // ~5 req/s par IP
    let auth_rl = RateLimiter::new(10, Duration::from_secs(3600)); // brute-force login/refresh
    let visits_rl = RateLimiter::new(5, Duration::from_secs(60)); // spam de la table visits

    tracing::info!(
        "🚀 Saints API launching on http://{}:{}",
        cfg.bind_address,
        cfg.port
    );

    HttpServer::new(move || {
        App::new()
            .wrap(global_rl.clone()) // en premier = le plus interne → 429 passe par CORS
            .wrap(daily_rl.clone()) // déclaré après = plus externe = évalué en premier
            .wrap(cors(&cfg_data))
            .wrap(Logger::default())
            .app_data(pool_data.clone())
            .app_data(cfg_data.clone())
            .app_data(error::json_config())
            .app_data(error::query_config())
            .app_data(error::path_config())
            .service(router(auth_rl.clone(), visits_rl.clone()))
            .default_service(
                web::route().to(|| async { error::ApiError::NotFound.error_response() }),
            )
    })
    .bind((cfg.bind_address, cfg.port))?
    .run()
    .await
}
