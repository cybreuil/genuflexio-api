use sqlx::PgPool;

use super::{
    dto::{SaintDetailResponse, SaintFacets, SaintImage, SaintListItem, SaintListItemComplete},
    repo,
};
use crate::core::{
    error::ApiError,
    pagination::{Paginated, Pagination},
    validation,
};

pub async fn list_saints_complete(
    pool: &PgPool,
    page: i32,
    per_page: i32,
    language_code: Option<&str>,
    century: Option<i16>,
    q: Option<&str>,
    sort: Option<&str>,
    attributes: Option<&str>,
    patronages: Option<&str>,
    include_facets: bool,
) -> Result<Paginated<SaintListItemComplete, SaintFacets>, ApiError> {
    let lang = validation::resolve_locale(language_code)?;

    let attributes = split_codes(attributes);
    let patronages = split_codes(patronages);
    let filters = repo::SaintsFilters {
        language_code: lang,
        q,
        century,
        attributes: attributes.as_deref(),
        patronages: patronages.as_deref(),
    };

    let p = Pagination::new(Some(page), Some(per_page));
    let total = repo::count_saints(pool, filters).await? as i32;

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

    let data = repo::list_saints_complete(pool, filters, sort, p.per_page, p.offset).await?;

    if !include_facets {
        return Ok(Paginated::new(&p, total, data));
    }

    let (century, title, order, symbol, patronage) = tokio::try_join!(
        repo::facet_saints_centuries(pool, filters),
        repo::facet_saints_attributes(pool, filters, "title"),
        repo::facet_saints_attributes(pool, filters, "order"),
        repo::facet_saints_attributes(pool, filters, "symbol"),
        repo::facet_saints_patronages(pool, filters),
    )?;

    Ok(Paginated::with_context(
        &p,
        total,
        SaintFacets {
            century,
            title,
            order,
            symbol,
            patronage,
        },
        data,
    ))
}

/// "VIRGIN, martyr,," → Some(["VIRGIN", "MARTYR"]). Empty or absent → None.
fn split_codes(raw: Option<&str>) -> Option<Vec<String>> {
    let codes: Vec<String> = raw?
        .split(',')
        .map(|c| c.trim().to_uppercase())
        .filter(|c| !c.is_empty())
        .collect();
    (!codes.is_empty()).then_some(codes)
}

pub async fn list_all_saints(pool: &PgPool) -> Result<Vec<SaintListItem>, ApiError> {
    repo::list_all_saints(pool).await
}

pub async fn get_saint_by_slug(
    pool: &PgPool,
    slug: &str,
    language_code: Option<&str>,
) -> Result<SaintDetailResponse, ApiError> {
    let slug = validation::resolve_slug(slug)?;
    let lang = validation::resolve_locale(language_code)?;

    let saint = repo::get_saint_by_slug(pool, slug, lang).await?;
    let saint_id = saint.id;

    // Quadruple fetch: get images, places, attributes, and patronages for the saint
    let (images, places, attributes, patronages) = tokio::try_join!(
        repo::get_saint_images(pool, saint_id),
        repo::get_saint_places(pool, saint_id, lang),
        repo::get_saint_attributes(pool, saint_id, lang),
        repo::get_saint_patronages(pool, saint_id, lang)
    )?;

    Ok(SaintDetailResponse {
        saint,
        images,
        places,
        attributes,
        patronages,
    })
}

pub async fn get_random_saints_images(
    pool: &PgPool,
    count: i32,
) -> Result<Vec<SaintImage>, ApiError> {
    // Limitting the count to a reasonable range to avoid overloading the database or returning too many results.
    let count = if count < 1 {
        1
    } else if count > 100 {
        100
    } else {
        count
    };

    let images = repo::get_random_saints_images(pool, count).await?;

    Ok(images)
}

// pub async fn get_saint(
//     pool: PgPool,
//     id: i32,
//     query: crate::models::saint::SaintQuery,
// ) -> Result<dto::SaintDetailResponse, ApiError> {
//     repo::get_saint(pool, id, query).await
// }

// pub async fn create_saint(
//     pool: PgPool,
//     body: crate::models::saint::CreateSaint,
// ) -> Result<dto::SaintResponse, ApiError> {
//     repo::create_saint(pool, body).await
// }

// pub async fn update_saint(
//     pool: PgPool,
//     id: i32,
//     body: crate::models::saint::UpdateSaint,
// ) -> Result<dto::SaintResponse, ApiError> {
//     repo::update_saint(pool, id, body).await
// }

// pub async fn delete_saint(pool: PgPool, id: i32) -> Result<(), ApiError> {
//     repo::delete_saint(pool, id).await
// }
