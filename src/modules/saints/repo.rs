use sqlx::PgPool;

use super::dto::{SaintDetail, SaintImage, SaintListItem, SaintListItemComplete, SaintPlace};

use crate::core::error::ApiError;

pub async fn list_saints_complete(
    pool: &PgPool,
    limit: i32,
    offset: i32,
    language_code: &str,
    q: Option<&str>,
    sort: Option<&str>,
    century: Option<i16>,
) -> Result<Vec<SaintListItemComplete>, ApiError> {
    let rows = sqlx::query_as::<_, SaintListItemComplete>(
        r#"
        SELECT
            s.id,
            s.slug,
            s.default_name,
            s.century,
            st.name,
            img.image_url
        FROM saints s
        LEFT JOIN saint_translations st
            ON st.saint_id = s.id
            AND st.locale_code = $1
        LEFT JOIN LATERAL (
            SELECT i.image_url
            FROM saint_images si
            JOIN images i ON i.id = si.image_id
            WHERE si.saint_id = s.id
            ORDER BY si.is_primary DESC, si.sort_order ASC
            LIMIT 1
        ) img ON TRUE
        WHERE
            (
                $2::text IS NULL
                OR s.default_name ILIKE '%' || $2 || '%'
                OR st.name ILIKE '%' || $2 || '%'
            )
            AND (
                $3::smallint IS NULL
                OR s.century = $3
            )
        ORDER BY
            CASE
                WHEN $4 = 'century_asc' THEN s.century
            END ASC,
            CASE
                WHEN $4 = 'century_desc' THEN s.century
            END DESC,
            CASE WHEN $4 = 'name_asc'
					THEN s.default_name
			END ASC,
            CASE
                WHEN $4 = 'name_desc' THEN s.default_name
            END DESC,
            CASE WHEN $4 = 'random'
                    THEN RANDOM()
            END,
            CASE WHEN $4 IN ('century_asc', 'century_desc')
            	THEN s.default_name
            END ASC
        LIMIT $5
        OFFSET $6
        "#,
    )
    .bind(language_code) // $1
    .bind(q) // $2
    .bind(century) // $3
    .bind(sort) // $4
    .bind(limit) // $5
    .bind(offset) // $6
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn list_all_saints(pool: &PgPool) -> Result<Vec<SaintListItem>, ApiError> {
    let rows = sqlx::query_as::<_, SaintListItem>(
        "SELECT id, slug, default_name, birth_year, death_year
         FROM saints ORDER BY default_name ASC",
    )
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn get_saint_by_slug(
    pool: &PgPool,
    slug: &str,
    language_code: &str,
) -> Result<SaintDetail, ApiError> {
    let row = sqlx::query_as::<_, SaintDetail>(
        r#"
    SELECT
    	s.id,
     	s.slug,
      	s.default_name,
       	s.birth_year,
        s.birth_month,
        s.birth_day,
        s.birth_is_approximate,
        s.death_year,
        s.death_month,
        s.death_day,
        s.death_is_approximate,
        s.century,
        st.name,
        st.short_description,
        st.full_biography
    FROM saints as s
    LEFT JOIN saint_translations st
    	ON st.saint_id = s.id
     	AND st.locale_code = $1
    WHERE s.slug = $2
	"#,
    )
    .bind(language_code)
    .bind(slug)
    .fetch_one(pool)
    .await?;

    Ok(row)
}

pub async fn get_saint_images(pool: &PgPool, saint_id: i32) -> Result<Vec<SaintImage>, ApiError> {
    let rows = sqlx::query_as::<_, SaintImage>(
        r#"
    SELECT
        i.id,
        i.image_url,
        i.title,
        i.image_type,
        COALESCE(si.alt_text_override, i.alt_text) AS alt_text,
        COALESCE(si.caption_override, i.caption)   AS caption,
        i.creator,
        i.date_label,
        i.repository,
        i.credit,
        i.license,
        i.source_url,
        si.saint_id,
        si.sort_order,
        si.is_primary
    FROM saint_images si
    JOIN images i ON i.id = si.image_id
    	WHERE si.saint_id = $1
    ORDER BY si.is_primary DESC, si.sort_order ASC
    "#,
    )
    .bind(saint_id)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn get_saint_places(
    pool: &PgPool,
    saint_id: i32,
    language_code: &str,
) -> Result<Vec<SaintPlace>, ApiError> {
    let rows = sqlx::query_as::<_, SaintPlace>(
        r#"
    SELECT
    	'birth' AS role,
        p.code,
        pt.name,
        p.country_code,
        p.latitude,
        p.longitude
    FROM saints s
    JOIN places p ON p.id = s.place_of_birth_id
    LEFT JOIN place_translations pt ON pt.place_id = p.id AND pt.locale_code = $1
    WHERE s.id = $2

    UNION ALL
    SELECT 'death' AS role,
           p.code, pt.name, p.country_code, p.latitude, p.longitude
    FROM saints s
    JOIN places p ON p.id = s.place_of_death_id
    LEFT JOIN place_translations pt ON pt.place_id = p.id AND pt.locale_code = $1
    WHERE s.id = $2

    UNION ALL
    SELECT 'activity' AS role,
           p.code, pt.name, p.country_code, p.latitude, p.longitude
    FROM saints s
    JOIN places p ON p.id = s.place_of_activity_id
    LEFT JOIN place_translations pt ON pt.place_id = p.id AND pt.locale_code = $1
    WHERE s.id = $2
    "#,
    )
    .bind(language_code)
    .bind(saint_id)
    .fetch_all(pool)
    .await?;
    Ok(rows)
}

pub async fn get_saint_attributes(
    pool: &PgPool,
    saint_id: i32,
    language_code: &str,
) -> Result<Vec<super::dto::SaintAttribute>, ApiError> {
    let rows = sqlx::query_as::<_, super::dto::SaintAttribute>(
        r#"
	SELECT
		a.code,
		a.category,
		at.label,
		at.description
	FROM saints s
	JOIN saint_attributes sa ON sa.saint_id = s.id
	JOIN attributes a ON a.id = sa.attribute_id
	LEFT JOIN attribute_translations at ON at.attribute_id = a.id AND at.locale_code = $1
	WHERE s.id = $2
	ORDER BY a.category, a.code
	"#,
    )
    .bind(language_code)
    .bind(saint_id)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn get_saint_patronages(
    pool: &PgPool,
    saint_id: i32,
    language_code: &str,
) -> Result<Vec<super::dto::SaintPatronage>, ApiError> {
    let rows = sqlx::query_as::<_, super::dto::SaintPatronage>(
        r#"
	SELECT
		p.code,
		pt.label,
		pt.description
	FROM saints s
	JOIN saint_patronages sp ON sp.saint_id = s.id
	JOIN patronages p ON p.id = sp.patronage_id
	LEFT JOIN patronage_translations pt ON pt.patronage_id = p.id AND pt.locale_code = $1
	WHERE s.id = $2
	ORDER BY p.code
	"#,
    )
    .bind(language_code)
    .bind(saint_id)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn count_saints(
    pool: &PgPool,
    language_code: &str,
    q: Option<&str>,
    century: Option<i16>,
) -> Result<i64, sqlx::Error> {
    let total = sqlx::query_scalar::<_, i64>(
        r#"
        SELECT COUNT(*)
        FROM saints s
        LEFT JOIN saint_translations st
            ON st.saint_id = s.id
            AND st.locale_code = $1
        WHERE
            (
                $2::text IS NULL
                OR s.default_name ILIKE '%' || $2 || '%'
                OR st.name ILIKE '%' || $2 || '%'
            )
            AND (
                $3::smallint IS NULL
                OR s.century = $3
            )
        "#,
    )
    .bind(language_code)
    .bind(q)
    .bind(century)
    .fetch_one(pool)
    .await?;

    Ok(total)
}

pub async fn get_random_saints_images(
    pool: &PgPool,
    count: i32,
) -> Result<Vec<SaintImage>, ApiError> {
    let rows = sqlx::query_as::<_, SaintImage>(
        r#"
	SELECT
		i.id,
		i.image_url,
		i.title,
		i.image_type,
		COALESCE(si.alt_text_override, i.alt_text) AS alt_text,
		COALESCE(si.caption_override, i.caption)   AS caption,
		i.creator,
		i.date_label,
		i.repository,
		i.credit,
		i.license,
		i.source_url,
		si.saint_id,
		si.sort_order,
		si.is_primary
	FROM saint_images si
	JOIN images i ON i.id = si.image_id
	ORDER BY RANDOM()
	LIMIT $1
	"#,
    )
    .bind(count)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}
