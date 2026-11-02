use crate::modules;
use actix_web::{web, Scope};

pub fn router() -> Scope {
    web::scope("")
        .service(modules::auth::router::router())
        .service(modules::saints::router::router())
        .service(modules::images::router::router())
        // .service(modules::feasts::router::router())
        .service(modules::health::router::router())
        .service(modules::root::router::router())
        .service(modules::celebrations::router::router())
        .service(modules::places::router::router())
        .service(modules::calendars::router::router())
        .service(modules::liturgical_seasons::router::router())
        .service(modules::visits::router::router())
}
