use crate::core::facets::wants_facets;
use actix_web::{web, HttpResponse};
use sqlx::PgPool;

// use crate::core::config::Config;
use crate::core::error::ApiError;
// use crate::middleware::auth::require_auth;

use super::dto;
use super::service;

pub async fn list_saints_complete(
    pool: web::Data<PgPool>,
    query: web::Query<dto::SaintsListQuery>,
) -> Result<HttpResponse, ApiError> {
    let result = service::list_saints_complete(
        pool.get_ref(),
        query.page.unwrap_or(1),
        query.per_page.unwrap_or(20),
        query.language_code.as_deref(),
        query.century,
        query.q.as_deref(),
        query.sort.as_deref(),
        query.attributes.as_deref(),
        query.patronages.as_deref(),
        wants_facets(query.include_facets.as_deref()),
    )
    .await?;

    Ok(HttpResponse::Ok().json(result))
}

pub async fn list_all_saints(pool: web::Data<PgPool>) -> Result<HttpResponse, ApiError> {
    let result = service::list_all_saints(pool.get_ref()).await?;

    Ok(HttpResponse::Ok().json(result))
}

pub async fn get_saint_by_slug(
    pool: web::Data<PgPool>,
    path: web::Path<String>,
    query: web::Query<dto::LangQuery>,
) -> Result<HttpResponse, ApiError> {
    let slug = path.into_inner();
    let result = service::get_saint_by_slug(
        pool.get_ref(),
        &slug,
        query.language_code.as_deref(), // Option<&str>
    )
    .await?;

    Ok(HttpResponse::Ok().json(result))
}

pub async fn get_random_saints_images(
    pool: web::Data<PgPool>,
    query: web::Query<dto::RandomImagesQuery>,
) -> Result<HttpResponse, ApiError> {
    let count = query.count.unwrap_or(1);
    let result = service::get_random_saints_images(pool.get_ref(), count).await?;

    Ok(HttpResponse::Ok().json(result))
}
// pub async fn get_saint(
//     pool: web::Data<PgPool>,
//     path: web::Path<i32>,
//     query: web::Query<crate::models::saint::SaintQuery>,
// ) -> Result<HttpResponse, ApiError> {
//     let result =
//         service::get_saint(pool.into_inner(), path.into_inner(), query.into_inner()).await?;
//     Ok(HttpResponse::Ok().json(result))
// }

// pub async fn create_saint(
//     req: HttpRequest,
//     pool: web::Data<PgPool>,
//     config: web::Data<Config>,
//     body: web::Json<crate::models::saint::CreateSaint>,
// ) -> Result<HttpResponse, ApiError> {
//     require_auth(&req, &config.jwt_secret)?;

//     let result = service::create_saint(pool.into_inner(), body.into_inner()).await?;
//     Ok(HttpResponse::Created().json(result))
// }

// pub async fn update_saint(
//     req: HttpRequest,
//     pool: web::Data<PgPool>,
//     config: web::Data<Config>,
//     path: web::Path<i32>,
//     body: web::Json<crate::models::saint::UpdateSaint>,
// ) -> Result<HttpResponse, ApiError> {
//     require_auth(&req, &config.jwt_secret)?;

//     let result =
//         service::update_saint(pool.into_inner(), path.into_inner(), body.into_inner()).await?;

//     Ok(HttpResponse::Ok().json(result))
// }

// pub async fn delete_saint(
//     req: HttpRequest,
//     pool: web::Data<PgPool>,
//     config: web::Data<Config>,
//     path: web::Path<i32>,
// ) -> Result<HttpResponse, ApiError> {
//     require_auth(&req, &config.jwt_secret)?;

//     service::delete_saint(pool.into_inner(), path.into_inner()).await?;

//     Ok(HttpResponse::NoContent().finish())
// }
