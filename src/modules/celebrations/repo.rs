use sqlx::PgPool;

use super::dto::{CelebrationRow, LiturgicalRankRow, SaintRow};
use crate::core::error::ApiError;

pub async fn get_celebrations(
    pool: &PgPool,
    limit: i32,
    offset: i32,
    calendar_code: &str,
    language_code: &str,
) -> Result<Vec<CelebrationRow>, ApiError> {
    let rows = sqlx::query_as::<_, CelebrationRow>(
        r#"
		SELECT c.id,
			   c.is_optional,
			   c.rank_id,
			   c.feast_id,
			   c.date_kind,
			   c.month,
			   c.day,
			   c.movable_base,
			   c.movable_offset_days,
			   c.notes,
			   c.observance_type,
			   f.default_name,
			   f.feast_type,
			   ft.name AS feast_name,
			   ft.description AS feast_description,
			   f.cover_image_id AS feast_cover_image_id,
			   fci.image_url AS feast_cover_image_url,
			   lct.label AS liturgical_color_name,
			   lc.hex_color AS liturgical_color_hex,
			   lr.code AS rank_code,
			   lr.precedence AS rank_precedence,
			   lrt.label AS rank_label
		FROM celebrations c
		LEFT JOIN feasts f
			ON c.feast_id = f.id
		LEFT JOIN images fci
			ON f.cover_image_id = fci.id
		LEFT JOIN feast_translations ft
			ON f.id = ft.feast_id
		 	AND ft.locale_code = $3
		LEFT JOIN liturgical_colors lc
			ON c.color_id = lc.id
		LEFT JOIN liturgical_color_translations lct
			ON lc.id = lct.color_id
		 	AND lct.locale_code = $3
		LEFT JOIN liturgical_ranks lr
			ON c.rank_id = lr.id
		LEFT JOIN liturgical_rank_translations lrt
			ON lr.id = lrt.rank_id
		 	AND lrt.locale_code = $3
		LEFT JOIN calendars cal
			ON c.calendar_id = cal.id
			AND cal.code = $4
		ORDER BY c.id ASC
		LIMIT $1 OFFSET $2
		"#,
    )
    .bind(limit)
    .bind(offset)
    .bind(language_code)
    .bind(calendar_code)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn get_fixed_celebrations_by_date(
    pool: &PgPool,
    month: i16,
    day: i16,
    language_code: &str,
    calendar_code: &str,
) -> Result<Vec<CelebrationRow>, ApiError> {
    let rows = sqlx::query_as::<_, CelebrationRow>(
        r#"
        SELECT c.id,
               c.is_optional,
               c.rank_id,
               c.feast_id,
               c.date_kind,
               c.month,
               c.day,
               c.movable_base,
               c.movable_offset_days,
               c.notes,
               c.observance_type,
               f.default_name,
			   f.feast_type,
			   ft.name AS feast_name,
			   ft.description AS feast_description,
			   f.cover_image_id AS feast_cover_image_id,
			   fci.image_url AS feast_cover_image_url,
			   lct.label AS liturgical_color_name,
			   lc.hex_color AS liturgical_color_hex,
			   lr.code AS rank_code,
			   lr.precedence AS rank_precedence,
			   lrt.label AS rank_label
        FROM celebrations c
        LEFT JOIN feasts f
        	ON c.feast_id = f.id
        LEFT JOIN images fci
        	ON f.cover_image_id = fci.id
        LEFT JOIN feast_translations ft
			ON f.id = ft.feast_id
			AND ft.locale_code = $3
        LEFT JOIN liturgical_colors lc
        	ON c.color_id = lc.id
        LEFT JOIN liturgical_color_translations lct
        	ON lc.id = lct.color_id
         	AND lct.locale_code = $3
		LEFT JOIN liturgical_ranks lr
			ON c.rank_id = lr.id
		LEFT JOIN liturgical_rank_translations lrt
			ON lr.id = lrt.rank_id
		 	AND lrt.locale_code = $3
		INNER JOIN calendars cal
			ON c.calendar_id = cal.id
			AND cal.code = $4
		WHERE c.month = $1
			AND c.day = $2
			AND c.date_kind = 'fixed'
        ORDER BY rank_precedence ASC, c.id ASC
        "#,
    )
    .bind(month)
    .bind(day)
    .bind(language_code)
    .bind(calendar_code)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn get_movable_celebrations(
    pool: &PgPool,
    language_code: &str,
    calendar_code: &str,
) -> Result<Vec<CelebrationRow>, ApiError> {
    let rows = sqlx::query_as::<_, CelebrationRow>(
        r#"
    SELECT c.id,
           c.is_optional,
           c.rank_id,
           c.feast_id,
           c.date_kind,
           c.month,
           c.day,
           c.movable_base,
           c.movable_offset_days,
           c.notes,
           c.observance_type,
           f.default_name,
           f.feast_type,
           ft.name AS feast_name,
           ft.description AS feast_description,
           f.cover_image_id AS feast_cover_image_id,
           fci.image_url AS feast_cover_image_url,
           lct.label AS liturgical_color_name,
           lc.hex_color AS liturgical_color_hex,
		   lr.code AS rank_code,
		   lr.precedence AS rank_precedence,
		   lrt.label AS rank_label
    FROM celebrations c
    LEFT JOIN feasts f
    	ON c.feast_id = f.id
    LEFT JOIN images fci
    	ON f.cover_image_id = fci.id
    LEFT JOIN feast_translations ft
		ON f.id = ft.feast_id
		AND ft.locale_code = $1
    LEFT JOIN liturgical_colors lc
    	ON c.color_id = lc.id
    LEFT JOIN liturgical_color_translations lct
    	ON lc.id = lct.color_id
    	AND lct.locale_code = $1
	LEFT JOIN liturgical_ranks lr
		ON c.rank_id = lr.id
	LEFT JOIN liturgical_rank_translations lrt
		ON lr.id = lrt.rank_id
	 	AND lrt.locale_code = $1
	INNER JOIN calendars cal
		ON c.calendar_id = cal.id
		AND cal.code = $2
	WHERE c.date_kind = 'movable'
    ORDER BY c.rank_id DESC, c.id ASC
    "#,
    )
    .bind(language_code)
    .bind(calendar_code)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

/// Fetches all saints linked to the given feast IDs, one row per saint.
/// The caller groups them by `feast_id`.
pub async fn get_saints_for_feasts(
    pool: &PgPool,
    feast_ids: &[i32],
    language_code: &str,
) -> Result<Vec<SaintRow>, ApiError> {
    let rows = sqlx::query_as::<_, SaintRow>(
        r#"
        SELECT
            fs.feast_id,
            s.id   AS saint_id,
            s.slug AS saint_slug,
            st.name AS saint_name,
            st.life_label AS saint_life_label,
            s.century AS saint_century,
            img.image_url AS saint_image_url
        FROM feast_saints fs
        JOIN saints s
            ON s.id = fs.saint_id
        LEFT JOIN saint_translations st
            ON st.saint_id = s.id
            AND st.locale_code = $2
        LEFT JOIN LATERAL (
            SELECT i.image_url
            FROM saint_images si
            JOIN images i ON i.id = si.image_id
            WHERE si.saint_id = s.id
            ORDER BY si.is_primary DESC, si.sort_order ASC
            LIMIT 1
        ) img ON TRUE
        WHERE fs.feast_id = ANY($1)
        ORDER BY fs.feast_id, fs.role, s.id
        "#,
    )
    .bind(feast_ids)
    .bind(language_code)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn get_lowest_rank(
    pool: &PgPool,
    calendar_code: &str,
    language_code: &str,
) -> Result<LiturgicalRankRow, ApiError> {
    let rank = sqlx::query_as::<_, LiturgicalRankRow>(
        r#"
		SELECT
			lr.id,
			lr.code,
			lr.precedence,
			lrt.label
		FROM liturgical_ranks lr
		LEFT JOIN liturgical_rank_translations lrt
			ON lr.id = lrt.rank_id
			AND lrt.locale_code = $2
		INNER JOIN calendars cal
			ON cal.id = lr.calendar_id
			AND cal.code = $1
		ORDER BY lr.precedence DESC
		LIMIT 1
		"#,
    )
    .bind(calendar_code)
    .bind(language_code)
    .fetch_one(pool)
    .await?;

    Ok(rank)
}

pub async fn get_ordinary_sunday_rank(
    pool: &PgPool,
    calendar_code: &str,
    language_code: &str,
) -> Result<LiturgicalRankRow, ApiError> {
    let rank = sqlx::query_as::<_, LiturgicalRankRow>(
        r#"
		SELECT
			lr.id,
			lr.code,
			lr.precedence,
			lrt.label
		FROM liturgical_ranks lr
		LEFT JOIN liturgical_rank_translations lrt
			ON lr.id = lrt.rank_id
			AND lrt.locale_code = $2
		INNER JOIN calendars cal
			ON cal.id = lr.calendar_id
			AND cal.code = $1
		WHERE lr.code = 'SUNDAY_ORDINARY'
		LIMIT 1
		"#,
    )
    .bind(calendar_code)
    .bind(language_code)
    .fetch_one(pool)
    .await?;

    Ok(rank)
}

pub async fn get_rank_by_code(
    pool: &PgPool,
    calendar_code: &str,
    rank_code: &str,
    language_code: &str,
) -> Result<LiturgicalRankRow, ApiError> {
    let rank = sqlx::query_as::<_, LiturgicalRankRow>(
        r#"
		SELECT
			lr.id,
			lr.code,
			lr.precedence,
			lrt.label
		FROM liturgical_ranks lr
		LEFT JOIN liturgical_rank_translations lrt
			ON lr.id = lrt.rank_id
			AND lrt.locale_code = $3
		INNER JOIN calendars cal
			ON cal.id = lr.calendar_id
			AND cal.code = $1
		WHERE lr.code = $2
		LIMIT 1
		"#,
    )
    .bind(calendar_code)
    .bind(rank_code)
    .bind(language_code)
    .fetch_one(pool)
    .await?;

    Ok(rank)
}

// pub async fn get_parent_calendar_code(
//     pool: &PgPool,
//     calendar_code: &str,
// ) -> Result<Option<String>, ApiError> {
//     let parent_calendar_code = sqlx::query_scalar!(
//         r#"
// 		SELECT code FROM calendars
// 		WHERE id = (SELECT parent_id FROM calendars WHERE code = $1)
// 		"#,
//         calendar_code
//     )
//     .fetch_optional(pool)
//     .await?;
//
//     Ok(parent_calendar_code)
// }

pub async fn count_celebrations(pool: &PgPool, calendar_code: &str) -> Result<i64, ApiError> {
    let count = sqlx::query_scalar!(
        r#"
    SELECT COUNT(*) as "count!" FROM celebrations
    INNER JOIN calendars cal
		ON celebrations.calendar_id = cal.id
		WHERE cal.code = $1
    "#,
        calendar_code
    )
    .fetch_one(pool)
    .await?;

    Ok(count)
}

/// Returns all feast_ids claimed by a given calendar (regardless of date).
/// Used to build the exclusion set when merging calendar hierarchies:
/// if a child calendar owns a feast, the parent's version is suppressed in all ancestors.
pub async fn get_claimed_feast_ids(
    pool: &PgPool,
    calendar_code: &str,
) -> Result<Vec<i32>, ApiError> {
    let ids = sqlx::query_scalar(
        r#"
        SELECT DISTINCT c.feast_id
        FROM celebrations c
        INNER JOIN calendars cal ON cal.id = c.calendar_id
        WHERE cal.code = $1
        "#,
    )
    .bind(calendar_code)
    .fetch_all(pool)
    .await?;

    Ok(ids)
}
