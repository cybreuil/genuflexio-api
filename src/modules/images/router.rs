use super::handlers;
use actix_web::{web, Scope};

pub fn router() -> Scope {
    web::scope("/images")
        .route("", web::get().to(handlers::list_images))
        .route("full-list", web::get().to(handlers::list_all_images))
        .route("wall", web::get().to(handlers::list_wall_images))
}
