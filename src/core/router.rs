use crate::middleware::rate_limiter::RateLimiter;
use crate::modules;
use actix_web::{web, Scope};

pub fn router(auth_rl: RateLimiter, visits_rl: RateLimiter) -> Scope {
    web::scope("")
        .service(modules::auth::router::router().wrap(auth_rl))
        .service(modules::saints::router::router())
        .service(modules::images::router::router())
        // .service(modules::feasts::router::router())
        .service(modules::health::router::router())
        .service(modules::root::router::router())
        .service(modules::celebrations::router::router())
        .service(modules::places::router::router())
        .service(modules::calendars::router::router())
        .service(modules::liturgical_seasons::router::router())
        .service(modules::visits::router::router().wrap(visits_rl))
}
