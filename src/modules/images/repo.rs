use crate::core::error::ApiError;
use sqlx::types::Json;
use sqlx::PgPool;

use super::dto;
use super::dto::ImageSaint;

pub async fn list_images(
    pool: &PgPool,
    page: i32,
    per_page: i32,
    language_code: &str,
    q: Option<&str>,
    sort: Option<&str>,
) -> Result<Vec<dto::SaintImageDetailed>, ApiError> {
    let rows = sqlx::query_as!(
        dto::SaintImageDetailed,
        r#"
        WITH filtered_images AS (
            SELECT i.*
            FROM images i
            WHERE
                $4::text IS NULL
                OR i.title ILIKE '%' || $4 || '%'
                OR i.creator ILIKE '%' || $4 || '%'
                OR EXISTS (
                    SELECT 1
                    FROM saint_images si
                    JOIN saints s
                        ON s.id = si.saint_id
                    LEFT JOIN saint_translations st
                        ON st.saint_id = s.id
                        AND st.locale_code = $3
                    WHERE si.image_id = i.id
                      AND (
                          s.default_name ILIKE '%' || $4 || '%'
                          OR st.name ILIKE '%' || $4 || '%'
                      )
                )
        ),
        paginated_images AS (
            SELECT *
            FROM filtered_images
            ORDER BY
                CASE WHEN $5 = 'asc' THEN id END ASC,
                CASE WHEN $5 = 'desc' THEN id END DESC
            LIMIT $2
            OFFSET (($1 - 1) * $2)
        )
        SELECT
            i.id,
            i.image_url,
            i.title,
            i.creator,
            i.image_type,
            i.alt_text,
            i.caption,
            i.date_label,
            i.century,
            i.repository,
            i.credit,
            i.license,
            i.source_url,
            i.width,
            i.height,
            COALESCE(
                (
                    SELECT jsonb_agg(
                        jsonb_build_object(
                            'id', s.id,
                            'slug', s.slug,
                            'name', st.name
                        )
                        ORDER BY s.id
                    )
                    FROM saint_images si
                    JOIN saints s
                        ON s.id = si.saint_id
                    LEFT JOIN saint_translations st
                        ON st.saint_id = s.id
                        AND st.locale_code = $3
                    WHERE si.image_id = i.id
                ),
                '[]'::jsonb
            ) AS "saints!: sqlx::types::Json<Vec<dto::ImageSaint>>"
        FROM paginated_images i
        ORDER BY
            CASE WHEN $5 = 'asc' THEN i.id END ASC,
            CASE WHEN $5 = 'desc' THEN i.id END DESC
        "#,
        page,
        per_page,
        language_code,
        q,
        sort.unwrap_or("asc"),
    )
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn count_images(
    pool: &PgPool,
    language_code: &str,
    q: Option<&str>,
) -> Result<i64, ApiError> {
    let row = sqlx::query!(
        r#"
        SELECT COUNT(*) AS count
        FROM images i
        WHERE
            $1::text IS NULL
            OR i.title ILIKE '%' || $1 || '%'
            OR i.creator ILIKE '%' || $1 || '%'
            OR EXISTS (
                SELECT 1
                FROM saint_images si
                JOIN saints s
                    ON s.id = si.saint_id
                LEFT JOIN saint_translations st
                    ON st.saint_id = s.id
                    AND st.locale_code = $2
                WHERE si.image_id = i.id
                  AND (
                      s.default_name ILIKE '%' || $1 || '%'
                      OR st.name ILIKE '%' || $1 || '%'
                  )
            )
        "#,
        q,
        language_code,
    )
    .fetch_one(pool)
    .await?;

    Ok(row.count.unwrap_or(0))
}

pub struct ImageListParams<'a> {
    pub limit: i32,
    pub offset: i32,
    pub seed: Option<&'a str>,
    pub language_code: &'a str,
    pub q: Option<&'a str>,
    pub saint_id: Option<i32>,
    pub artist: Option<&'a str>,
    pub museum: Option<&'a str>,
    pub century: Option<i32>,
    pub sort: Option<&'a str>,
}

pub async fn list_all_images(
    pool: &PgPool,
    language_code: &str,
) -> Result<Vec<dto::SaintImageDetailed>, ApiError> {
    let rows = sqlx::query_as!(
        dto::SaintImageDetailed,
        r#"
        SELECT
            i.id,
            i.image_url,
            i.title,
            i.creator,
            i.image_type,
            i.alt_text,
            i.caption,
            i.date_label,
            i.century,
            i.repository,
            i.credit,
            i.license,
            i.source_url,
            i.width,
            i.height,
            COALESCE(
                (
                    SELECT jsonb_agg(
                        jsonb_build_object(
                            'id', s.id,
                            'slug', s.slug,
                            'name', st.name
                        )
                        ORDER BY s.id
                    )
                    FROM saint_images si
                    JOIN saints s
                        ON s.id = si.saint_id
                    LEFT JOIN saint_translations st
                        ON st.saint_id = s.id
                        AND st.locale_code = $1
                    WHERE si.image_id = i.id
                ),
                '[]'::jsonb
            ) AS "saints!: sqlx::types::Json<Vec<dto::ImageSaint>>"
        FROM images i
        ORDER BY i.id ASC
        "#,
        language_code
    )
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

// pub async fn list_wall_images(
//     pool: &PgPool,
//     params: &ImageListParams<'_>,
// ) -> Result<Vec<dto::SaintImageDetailed>, ApiError> {
//     let rows = sqlx::query_as!(
//         dto::SaintImageDetailed,
//         r#"
//         SELECT
//             i.id,
//             i.image_url,
//             i.title,
//             i.creator,
//             i.image_type,
//             i.alt_text,
//             i.caption,
//             i.date_label,
//             i.century,
//             i.repository,
//             i.credit,
//             i.license,
//             i.source_url,
//             i.width,
//             i.height,
//             s.id AS saint_id,
//             s.slug AS saint_slug,
//             st.name AS saint_name
//         FROM images i
//         JOIN saint_images si
//             ON si.image_id = i.id
//         JOIN saints s
//             ON s.id = si.saint_id
//         LEFT JOIN saint_translations st
//             ON st.saint_id = s.id
//             AND st.locale_code = $3
//         WHERE
//             (
//                 $4::text IS NULL
//                 OR i.title ILIKE '%' || $4 || '%'
//                 OR i.creator ILIKE '%' || $4 || '%'
//                 OR s.default_name ILIKE '%' || $4 || '%'
//                 OR st.name ILIKE '%' || $4 || '%'
//             )
//             AND (
//                 $5::int IS NULL
//                 OR s.id = $5
//             )
//             AND (
//                 $6::text IS NULL
//                 OR i.creator = $6
//             )
//             AND (
//                 $7::text IS NULL
//                 OR i.repository = $7
//             )
//             AND (
//                 $8::int IS NULL
//                 OR i.century = $8
//             )
//         ORDER BY
//             CASE
//                 WHEN $9 = 'title'
//                 THEN i.title
//             END ASC,

//             CASE
//                 WHEN $9 = 'artist'
//                 THEN i.creator
//             END ASC,

//             CASE
//                 WHEN $9 = 'century_asc'
//                 THEN i.century
//             END ASC,

//             CASE
//                 WHEN $9 = 'century_desc'
//                 THEN i.century
//             END DESC,

//             CASE
//                 WHEN $9 = 'default' AND $10::text IS NOT NULL
//                 THEN md5($10::text || '-' || i.id::text)
//             END ASC,

//             i.id ASC
//         LIMIT $1
//         OFFSET $2
//         "#,
//         params.limit as i64,
//         params.offset as i64,
//         params.language_code,
//         params.q,
//         params.saint_id,
//         params.artist,
//         params.museum,
//         params.century,
//         params.sort.unwrap_or("default"),
//         params.seed,
//     )
//     .fetch_all(pool)
//     .await?;

//     Ok(rows)
// }

pub async fn list_wall_images(
    pool: &PgPool,
    params: &ImageListParams<'_>,
) -> Result<Vec<dto::SaintImageDetailed>, ApiError> {
    let rows = sqlx::query_as!(
        dto::SaintImageDetailed,
        r#"
WITH filtered_images AS (
    SELECT i.*
    FROM images i
    WHERE
        (
            $4::text IS NULL
            OR i.title ILIKE '%' || $4 || '%'
            OR i.creator ILIKE '%' || $4 || '%'
            OR EXISTS (
                SELECT 1
                FROM saint_images si
                JOIN saints s ON s.id = si.saint_id
                LEFT JOIN saint_translations st
                    ON st.saint_id = s.id
                    AND st.locale_code = $3
                WHERE si.image_id = i.id
                  AND (
                      s.default_name ILIKE '%' || $4 || '%'
                      OR st.name ILIKE '%' || $4 || '%'
                  )
            )
        )
        AND (
            $5::int IS NULL
            OR EXISTS (
                SELECT 1
                FROM saint_images si
                WHERE si.image_id = i.id
                  AND si.saint_id = $5
            )
        )
        AND ($6::text IS NULL OR i.creator = $6)
        AND ($7::text IS NULL OR i.repository = $7)
        AND ($8::int IS NULL OR i.century = $8)
),
paginated_images AS (
    SELECT *
    FROM filtered_images
    ORDER BY
        CASE WHEN $9 = 'title'
            THEN title
        END ASC,
        CASE WHEN $9 = 'artist'
            THEN creator
        END ASC,
        CASE WHEN $9 = 'century_asc'
            THEN century
        END ASC,
        CASE WHEN $9 = 'century_desc'
            THEN century
        END DESC,
        CASE
            WHEN $9 = 'default' AND $10::text IS NOT NULL
            THEN md5($10::text || '-' || id::text)
        END ASC,
        id ASC
    LIMIT $1
    OFFSET $2
)
SELECT
    i.id,
    i.image_url,
    i.title,
    i.creator,
    i.image_type,
    i.alt_text,
    i.caption,
    i.date_label,
    i.century,
    i.repository,
    i.credit,
    i.license,
    i.source_url,
    i.width,
    i.height,
    COALESCE(
        (
            SELECT jsonb_agg(
                jsonb_build_object(
                    'id', s.id,
                    'slug', s.slug,
                    'name', st.name
                )
                ORDER BY s.id
            )
            FROM saint_images si
            JOIN saints s ON s.id = si.saint_id
            LEFT JOIN saint_translations st
                ON st.saint_id = s.id
                AND st.locale_code = $3
            WHERE si.image_id = i.id
        ),
        '[]'::jsonb
    ) AS "saints!: Json<Vec<ImageSaint>>"
FROM paginated_images i
ORDER BY
    CASE WHEN $9 = 'title'
        THEN i.title
    END ASC,
    CASE WHEN $9 = 'artist'
        THEN i.creator
    END ASC,
    CASE WHEN $9 = 'century_asc'
        THEN i.century
    END ASC,
    CASE WHEN $9 = 'century_desc'
        THEN i.century
    END DESC,
    CASE
        WHEN $9 = 'default' AND $10::text IS NOT NULL
        THEN md5($10::text || '-' || i.id::text)
    END ASC,
    i.id ASC;
    "#,
        params.limit as i64,
        params.offset as i64,
        params.language_code,
        params.q,
        params.saint_id,
        params.artist,
        params.museum,
        params.century,
        params.sort.unwrap_or("default"),
        params.seed,
    )
    .fetch_all(pool)
    .await?;

    Ok(rows)
}

pub async fn count_wall_images(
    pool: &PgPool,
    language_code: &str,
    q: Option<&str>,
    saint_id: Option<i32>,
    artist: Option<&str>,
    museum: Option<&str>,
    century: Option<i32>,
) -> Result<i64, ApiError> {
    let row = sqlx::query!(
        r#"
        SELECT COUNT(*) AS count
        FROM images i
        WHERE
            (
                $1::text IS NULL
                OR i.title ILIKE '%' || $1 || '%'
                OR i.creator ILIKE '%' || $1 || '%'
                OR EXISTS (
                    SELECT 1
                    FROM saint_images si
                    JOIN saints s
                        ON s.id = si.saint_id
                    LEFT JOIN saint_translations st
                        ON st.saint_id = s.id
                        AND st.locale_code = $2
                    WHERE si.image_id = i.id
                      AND (
                          s.default_name ILIKE '%' || $1 || '%'
                          OR st.name ILIKE '%' || $1 || '%'
                      )
                )
            )
            AND (
                $3::int IS NULL
                OR EXISTS (
                    SELECT 1
                    FROM saint_images si
                    WHERE si.image_id = i.id
                      AND si.saint_id = $3
                )
            )
            AND ($4::text IS NULL OR i.creator = $4)
            AND ($5::text IS NULL OR i.repository = $5)
            AND ($6::int IS NULL OR i.century = $6)
        "#,
        q,
        language_code,
        saint_id,
        artist,
        museum,
        century,
    )
    .fetch_one(pool)
    .await?;

    Ok(row.count.unwrap_or(0))
}
