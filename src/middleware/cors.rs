use crate::core::config::Config;
use actix_cors::Cors;
use actix_web::web;

// Full open don't forget to change this in production
pub fn cors(cfg: &web::Data<Config>) -> Cors {
    Cors::default()
        .allowed_origin(&cfg.frontend_url) // domain env ?
        .allowed_methods(vec!["GET", "POST", "PUT", "DELETE", "OPTIONS"])
        .allowed_headers(vec!["Content-Type", "Authorization"])
        .supports_credentials()
        .max_age(3600)
}
