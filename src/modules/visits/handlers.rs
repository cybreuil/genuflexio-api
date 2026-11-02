use actix_web::{web, HttpRequest, HttpResponse};
use sqlx::PgPool;

use crate::core::config::Config;
use crate::core::error::ApiError;
use crate::middleware::auth::require_admin;

use super::dto::{VisitMeta, VisitPayload, VisitsListQuery, VisitsPurgeQuery, VisitsStatsQuery};
use super::service;

/// POST /visits — public, fire-and-forget ping sent by the front on first load.
pub async fn log_visit(
    pool: web::Data<PgPool>,
    req: HttpRequest,
    body: web::Json<VisitPayload>,
) -> Result<HttpResponse, ApiError> {
    let meta = VisitMeta {
        ip: req
            .connection_info()
            .realip_remote_addr()
            .map(str::to_owned)
            .unwrap_or_else(|| "unknown".to_owned()),
        user_agent: header(&req, "User-Agent"),
        country_code: header(&req, "CF-IPCountry").or_else(|| header(&req, "X-Country-Code")),
    };

    service::record_visit(pool.get_ref(), body.into_inner(), meta).await?;
    Ok(HttpResponse::NoContent().finish())
}

/// GET /visits?page=&per_page=&range= — admin only
pub async fn list_visits(
    pool: web::Data<PgPool>,
    cfg: web::Data<Config>,
    req: HttpRequest,
    query: web::Query<VisitsListQuery>,
) -> Result<HttpResponse, ApiError> {
    require_admin(&req, &cfg.jwt_secret)?;
    let result =
        service::list_visits(pool.get_ref(), query.page, query.per_page, query.range).await?;
    Ok(HttpResponse::Ok().json(result))
}

/// GET /visits/stats?range= — admin only
pub async fn stats(
    pool: web::Data<PgPool>,
    cfg: web::Data<Config>,
    req: HttpRequest,
    query: web::Query<VisitsStatsQuery>,
) -> Result<HttpResponse, ApiError> {
    require_admin(&req, &cfg.jwt_secret)?;
    let result = service::get_stats(pool.get_ref(), query.range).await?;
    Ok(HttpResponse::Ok().json(result))
}

/// DELETE /visits?older_than=90d|30d|7d|all — admin only
pub async fn purge(
    pool: web::Data<PgPool>,
    cfg: web::Data<Config>,
    req: HttpRequest,
    query: web::Query<VisitsPurgeQuery>,
) -> Result<HttpResponse, ApiError> {
    require_admin(&req, &cfg.jwt_secret)?;
    let result = service::purge(pool.get_ref(), query.older_than).await?;
    Ok(HttpResponse::Ok().json(result))
}

fn header(req: &HttpRequest, name: &str) -> Option<String> {
    req.headers()
        .get(name)
        .and_then(|v| v.to_str().ok())
        .map(str::trim)
        .filter(|s| !s.is_empty())
        .map(str::to_owned)
}
