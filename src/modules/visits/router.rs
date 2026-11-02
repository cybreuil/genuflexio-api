use super::handlers;
use actix_web::{web, Scope};

pub fn router() -> Scope {
    web::scope("/visits")
        .route("", web::post().to(handlers::log_visit))
        .route("", web::get().to(handlers::list_visits))
        .route("", web::delete().to(handlers::purge))
        .route("/stats", web::get().to(handlers::stats))
}
