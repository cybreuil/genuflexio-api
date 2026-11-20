use sqlx::PgPool;

use super::dto::{LiturgicalSeasonListContext, LiturgicalSeasonResponse};
use super::repo;
use crate::core::error::ApiError;
use crate::core::liturgical_seasons;
use crate::core::pagination::{Paginated, Pagination};
use crate::core::validation;
use crate::modules::calendars;

pub async fn get_liturgical_season(
    pool: &PgPool,
    year: i32,
    month: i16,
    day: i16,
    language_code: Option<&str>,
    calendar_code: Option<&str>,
) -> Result<Option<LiturgicalSeasonResponse>, ApiError> {
    let lang = validation::resolve_locale(language_code)?;
    let cal = validation::resolve_calendar(calendar_code)?;

    let rows = repo::get_liturgical_season_intervals(pool, cal, lang).await?;

    let date = chrono::NaiveDate::from_ymd_opt(year, month as u32, day as u32)
        .ok_or_else(|| ApiError::BadRequest("Invalid date".to_string()))?;

    let calendar = calendars::get_calendar_by_code(pool, cal, lang).await?;
    let config = calendars::mapper::to_liturgical_config(&calendar);

    let intervals = liturgical_seasons::build_intervals(&rows, year, config)?;

    let primary = intervals
        .into_iter()
        .filter(|season| date >= season.start && date <= season.end)
        .min_by_key(|season| (season.end - season.start).num_days());

    Ok(primary.map(Into::into))
}

pub async fn list_liturgical_seasons(
    pool: &PgPool,
    year: i32,
    language_code: Option<&str>,
    calendar_code: Option<&str>,
    page: i32,
    per_page: i32,
) -> Result<Paginated<LiturgicalSeasonResponse, LiturgicalSeasonListContext>, ApiError> {
    let lang = validation::resolve_locale(language_code)?;
    let cal = validation::resolve_calendar(calendar_code)?;

    let context = LiturgicalSeasonListContext {
        year,
        language_code: lang.to_string(),
        calendar_code: cal.to_string(),
    };

    let p = Pagination::new(Some(page), Some(per_page));

    let calendar = calendars::get_calendar_by_code(pool, cal, lang).await?;
    let config = calendars::mapper::to_liturgical_config(&calendar);
    let rows = repo::get_liturgical_season_intervals(pool, cal, lang).await?;
    let intervals = liturgical_seasons::build_intervals(&rows, year, config)?;
    let total = intervals.len() as i32;

    if total == 0 {
        return Ok(Paginated::empty_with_context(&p, context));
    }

    if p.beyond_total(total) {
        return Err(ApiError::UnprocessableEntity(format!(
            "Page {} is out of range. Total pages: {}",
            p.page,
            p.total_pages(total)
        )));
    }

    let data = intervals
        .into_iter()
        .skip(p.offset as usize)
        .take(p.per_page as usize)
        .map(Into::into)
        .collect();

    Ok(Paginated::with_context(&p, total, context, data))
}
