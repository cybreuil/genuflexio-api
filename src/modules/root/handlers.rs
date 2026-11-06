use actix_web::HttpResponse;
use serde::Serialize;

// Struct for the index response, to keep order
#[derive(Serialize)]
struct IndexResponse {
    name: &'static str,
    version: &'static str,
    description: &'static str,
    github: &'static str,
    notes: &'static str,
    // health: Option<&'static str>,
    // docs: Option<&'static str>,
}

/// Simple API homepage — returns JSON with basic info and useful links.
pub async fn index() -> HttpResponse {
    let response = IndexResponse {
        name: "Genuflexio - A catholic API.",
        version: "0.9.0",
        description: "Lightweight RESTful API for Catholic saints and celebrations.",
        github: "https://github.com/cybreuil",
        notes: "API written in Rust using Actix-web, serving PostgreSQL data with SQLx.",
    };
    HttpResponse::Ok().json(response)
}
