use super::dto;
use super::repo;
use crate::core::{
    error::ApiError,
    pagination::{Paginated, Pagination},
    validation,
};
use sqlx::PgPool;

pub async fn list_images(
    pool: &PgPool,
    page: i32,
    per_page: i32,
    language_code: Option<&str>,
    q: Option<&str>,
    sort: Option<&str>,
) -> Result<Paginated<dto::SaintImageDetailed>, ApiError> {
    let lang = validation::resolve_locale(language_code)?;

    let p = Pagination::new(Some(page), Some(per_page));
    let total = repo::count_images(pool, lang, q).await? as i32;

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
    let data = repo::list_images(pool, page, per_page, lang, q, sort).await?;

    Ok(Paginated::new(&p, total, data))
}

pub async fn list_all_images(
    pool: &PgPool,
    language_code: Option<&str>,
) -> Result<Vec<dto::SaintImageDetailed>, ApiError> {
    let lang = validation::resolve_locale(language_code)?;

    let rows = repo::list_all_images(pool, lang).await?;
    Ok(rows)
}

pub async fn list_wall_images(
    pool: &PgPool,
    limit: i32,
    offset: i32,
    language_code: Option<&str>,
    q: Option<&str>,
    saint_id: Option<i32>,
    artist: Option<&str>,
    museum: Option<&str>,
    century: Option<i32>,
    sort: Option<&str>,
    seed: Option<&str>,
) -> Result<dto::ImageListWallResponse, ApiError> {
    let lang = validation::resolve_locale(language_code)?;

    let limit = limit.clamp(1, 100);
    let offset = offset.max(0);

    let sort = match sort {
        Some("title") => "title",
        Some("artist") => "artist",
        Some("century_asc") => "century_asc",
        Some("century_desc") => "century_desc",
        _ => "default",
    };

    let seed = seed.unwrap_or("");

    let total =
        repo::count_wall_images(pool, lang, q, saint_id, artist, museum, century).await? as i32;

    let data = repo::list_wall_images(
        pool,
        &repo::ImageListParams {
            limit,
            offset,
            language_code: lang,
            q,
            saint_id,
            artist,
            museum,
            century,
            sort: Some(sort),
            seed: Some(seed),
        },
    )
    .await?;

    let loaded = offset + data.len() as i32;
    let has_more = loaded < total;

    Ok(dto::ImageListWallResponse {
        data,
        total,
        has_more,
    })
}
