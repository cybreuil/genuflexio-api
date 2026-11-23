use sqlx::PgPool;

use super::dto;

use crate::core::error::ApiError;

pub async fn list_feasts_for_calendar_with_dates(
    pool: &PgPool,
    calendar_id: Option<i32>,
) -> Result<Vec<dto::FeastListItem>, ApiError> {
    let rows = sqlx::query_as::<_, dto::FeastListItem>(
        r#"
        SELECT
            f.slug,
            f.default_name,
            f.feast_type,
            fd.date_kind,
            fd.month,
            fd.day
        FROM feasts AS f
        LEFT JOIN feast_dates AS fd
            ON fd.feast_id = f.id
            AND ($1::int IS NULL OR fd.calendar_id = $1)
        ORDER BY f.slug ASC
        "#,
    )
    .bind(calendar_id)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn feast_the_day(
    pool: &PgPool,
    month: u8,
    day: u8,
) -> Result<Option<dto::FeastListItemDetailled>, ApiError> {
    let row = sqlx::query_as::<_, dto::FeastListItemDetailled>(
        r#"
        SELECT
            f.slug,
            f.default_name,
            f.feast_type,
            fd.date_kind,
            fd.month,
            fd.day,
            s.default_name AS saint_default_name,
            s.birth_year AS saint_birth_year,
            s.birth_month AS saint_birth_month,
            s.birth_day AS saint_birth_day,
            s.death_year AS saint_death_year,
            s.death_month AS saint_death_month,
            s.death_day AS saint_death_day,
            s.place_of_birth_id AS saint_place_of_birth,
            s.place_of_death_id AS saint_place_of_death,
            s.place_of_activity_id AS saint_place_of_activity
        FROM feasts f
        INNER JOIN feast_dates fd
            ON fd.feast_id = f.id
        LEFT JOIN feast_saints fs
            ON fs.feast_id = f.id
        LEFT JOIN saints s
            ON s.id = fs.saint_id
        WHERE fd.month = $1
          AND fd.day = $2
        LIMIT 1
        "#,
    )
    .bind(month as i32)
    .bind(day as i32)
    .fetch_optional(pool)
    .await?;

    Ok(row)
}

pub fn get_feast_by_slug<'a>(
    pool: &PgPool,
    slug: &'a str,
    language_code: Option<&'a str>,
    calendar_code: Option<&'a str>,
) -> Result<Option<dto::FeastListItemDetailled>, ApiError> {
	let row = sqlx::query_as::<_, dto::FeastListItemDetailled>(
		r#"
		SELECT
			f.slug,
			f.default_name,
			f.feast_type,
			fd.date_kind,
			fd.month,
			fd.day,
			s.default_name AS saint_default_name,
			s.birth_year AS saint_birth_year,
			s.birth_month AS saint_birth_month,
			s.birth_day AS saint_birth_day,
			s.death_year AS saint_death_year,
			s.death_month AS saint_death_month,
			s.death_day AS saint_death_day,
			s.place_of_birth_id AS saint_place_of_birth,
			s.place_of_death_id AS saint_place_of_death,
			s.place_of_activity_id AS saint_place_of_activity
		FROM feasts f
		INNER JOIN feast_dates fd
			ON fd.feast_id = f.id
		LEFT JOIN feast_saints fs
			ON fs.feast_id = f.id
		LEFT JOIN saints s
			ON s.id = fs.saint_id
		WHERE f.slug = $1
		  AND ($2::text IS NULL OR fd.calendar_id = (SELECT id FROM calendars WHERE code = $2))
		  AND ($3::text IS NULL OR f.id IN (
				SELECT feast_id FROM feast_translations WHERE language_code = $3
		  ))
		LIMIT 1
		"#,
	)
