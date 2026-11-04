use crate::core::facets::Facet;
use sqlx::PgPool;

use super::dto::{SaintDetail, SaintImage, SaintListItem, SaintListItemComplete, SaintPlace};

use crate::core::error::ApiError;

/// Bind order, identical everywhere this clause is used:
/// $1 language_code, $2 q, $3 century, $4 attribute codes (text[]), $5 patronage codes (text[])
/// Requires `saints s` and `saint_translations st` to be joined in the FROM.
const SAINTS_WHERE: &str = r#"
    (
        $2::text IS NULL
        OR s.default_name ILIKE '%' || $2 || '%'
        OR st.name ILIKE '%' || $2 || '%'
    )
    AND ($3::smallint IS NULL OR s.century = $3)
    AND (
        $4::text[] IS NULL
        OR NOT EXISTS (
            SELECT 1 FROM unnest($4::text[]) AS wanted(code)
            WHERE NOT EXISTS (
                SELECT 1
                FROM saint_attributes sa
                JOIN attributes a ON a.id = sa.attribute_id
                WHERE sa.saint_id = s.id AND a.code = wanted.code
            )
        )
    )
    AND (
        $5::text[] IS NULL
        OR NOT EXISTS (
            SELECT 1 FROM unnest($5::text[]) AS wanted(code)
            WHERE NOT EXISTS (
                SELECT 1
                FROM saint_patronages sp
                JOIN patronages p ON p.id = sp.patronage_id
                WHERE sp.saint_id = s.id AND p.code = wanted.code
            )
        )
    )
"#;

#[derive(Clone, Copy)]
pub struct SaintsFilters<'a> {
    pub language_code: &'a str,
    pub q: Option<&'a str>,
    pub century: Option<i16>,
    pub attributes: Option<&'a [String]>,
    pub patronages: Option<&'a [String]>,
}

pub async fn list_saints_complete(
    pool: &PgPool,
    f: SaintsFilters<'_>,
    sort: Option<&str>,
    limit: i32,
    offset: i32,
) -> Result<Vec<SaintListItemComplete>, ApiError> {
    let sql = format!(
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
            ON st.saint_id = s.id AND st.locale_code = $1
        LEFT JOIN LATERAL (
            SELECT i.image_url
            FROM saint_images si
            JOIN images i ON i.id = si.image_id
            WHERE si.saint_id = s.id
            ORDER BY si.is_primary DESC, si.sort_order ASC
            LIMIT 1
        ) img ON TRUE
        WHERE {SAINTS_WHERE}
        ORDER BY
            CASE WHEN $6 = 'century_asc'  THEN s.century END ASC,
            CASE WHEN $6 = 'century_desc' THEN s.century END DESC,
            CASE WHEN $6 = 'name_asc'     THEN s.default_name END ASC,
            CASE WHEN $6 = 'name_desc'    THEN s.default_name END DESC,
            CASE WHEN $6 = 'random'       THEN RANDOM() END,
            CASE WHEN $6 IN ('century_asc', 'century_desc') THEN s.default_name END ASC
        LIMIT $7
        OFFSET $8
        "#
    );

    let rows = sqlx::query_as::<_, SaintListItemComplete>(&sql)
        .bind(f.language_code) // $1
        .bind(f.q) // $2
        .bind(f.century) // $3
        .bind(f.attributes) // $4
        .bind(f.patronages) // $5
        .bind(sort) // $6
        .bind(limit) // $7
        .bind(offset) // $8
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

pub async fn count_saints(pool: &PgPool, f: SaintsFilters<'_>) -> Result<i64, ApiError> {
    let sql = format!(
        r#"
        SELECT COUNT(*)
        FROM saints s
        LEFT JOIN saint_translations st
            ON st.saint_id = s.id AND st.locale_code = $1
        WHERE {SAINTS_WHERE}
        "#
    );

    let total = sqlx::query_scalar::<_, i64>(&sql)
        .bind(f.language_code)
        .bind(f.q)
        .bind(f.century)
        .bind(f.attributes)
        .bind(f.patronages)
        .fetch_one(pool)
        .await?;

    Ok(total)
}
/// Single-select facet: its own filter ($3) is ignored so the user can switch century.
pub async fn facet_saints_centuries(
    pool: &PgPool,
    f: SaintsFilters<'_>,
) -> Result<Vec<Facet>, ApiError> {
    let sql = format!(
        r#"
        SELECT s.century::text AS value, s.century::text AS label, COUNT(*) AS count
        FROM saints s
        LEFT JOIN saint_translations st
            ON st.saint_id = s.id AND st.locale_code = $1
        WHERE {SAINTS_WHERE} AND s.century IS NOT NULL
        GROUP BY s.century
        ORDER BY s.century ASC
        "#
    );

    let rows = sqlx::query_as::<_, Facet>(&sql)
        .bind(f.language_code)
        .bind(f.q)
        .bind(None::<i16>) // $3 century: ignored
        .bind(f.attributes)
        .bind(f.patronages)
        .fetch_all(pool)
        .await?;

    Ok(rows)
}

/// Multi-select AND facet: the attribute filter ($4) is kept, so once "VIRGIN" is
/// selected the other titles shrink to those that co-occur with it.
/// `category` is one of "title" | "order" | "symbol".
pub async fn facet_saints_attributes(
    pool: &PgPool,
    f: SaintsFilters<'_>,
    category: &str,
) -> Result<Vec<Facet>, ApiError> {
    let sql = format!(
        r#"
        SELECT a.code AS value,
               COALESCE(at.label, a.code) AS label,
               COUNT(DISTINCT s.id) AS count
        FROM saints s
        LEFT JOIN saint_translations st
            ON st.saint_id = s.id AND st.locale_code = $1
        JOIN saint_attributes sa ON sa.saint_id = s.id
        JOIN attributes a ON a.id = sa.attribute_id AND a.category = $6
        LEFT JOIN attribute_translations at
            ON at.attribute_id = a.id AND at.locale_code = $1
        WHERE {SAINTS_WHERE}
        GROUP BY a.code, at.label
        ORDER BY count DESC, label ASC
        "#
    );

    let rows = sqlx::query_as::<_, Facet>(&sql)
        .bind(f.language_code)
        .bind(f.q)
        .bind(f.century)
        .bind(f.attributes)
        .bind(f.patronages)
        .bind(category) // $6
        .fetch_all(pool)
        .await?;

    Ok(rows)
}

/// Multi-select AND facet: the patronage filter ($5) is kept.
pub async fn facet_saints_patronages(
    pool: &PgPool,
    f: SaintsFilters<'_>,
) -> Result<Vec<Facet>, ApiError> {
    let sql = format!(
        r#"
        SELECT p.code AS value,
               COALESCE(pt.label, p.code) AS label,
               COUNT(DISTINCT s.id) AS count
        FROM saints s
        LEFT JOIN saint_translations st
            ON st.saint_id = s.id AND st.locale_code = $1
        JOIN saint_patronages sp ON sp.saint_id = s.id
        JOIN patronages p ON p.id = sp.patronage_id
        LEFT JOIN patronage_translations pt
            ON pt.patronage_id = p.id AND pt.locale_code = $1
        WHERE {SAINTS_WHERE}
        GROUP BY p.code, pt.label
        ORDER BY count DESC, label ASC
        LIMIT 30
        "#
    );

    let rows = sqlx::query_as::<_, Facet>(&sql)
        .bind(f.language_code)
        .bind(f.q)
        .bind(f.century)
        .bind(f.attributes)
        .bind(f.patronages)
        .fetch_all(pool)
        .await?;

    Ok(rows)
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
