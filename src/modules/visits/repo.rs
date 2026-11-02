use chrono::{DateTime, Utc};
use sqlx::PgPool;

use crate::core::error::ApiError;

use super::dto::{CountryCount, DailyCount, LabelledCount, TotalsRow, Visit};

#[derive(Debug)]
pub struct NewVisit {
    pub ip: String,
    pub country_code: Option<String>,
    pub country_name: Option<String>,
    pub city: Option<String>,
    pub device: String,
    pub browser: Option<String>,
    pub os: Option<String>,
    pub user_agent: Option<String>,
    pub path: String,
    pub referrer: Option<String>,
    pub language: Option<String>,
    pub timezone: Option<String>,
    pub screen_width: Option<i16>,
    pub theme: Option<String>,
    pub is_new_visitor: bool,
}

// All range filters share the same shape: `$1` is an optional number of days;
// NULL means "no lower bound" so a single query serves every `VisitsRange`.
const RANGE_FILTER: &str =
    "($1::int IS NULL OR visited_at >= now() - make_interval(days => $1::int))";

// ── Write ─────────────────────────────────────────────────────────────────────

pub async fn ip_seen_since(
    pool: &PgPool,
    ip: &str,
    since: DateTime<Utc>,
) -> Result<bool, ApiError> {
    let seen = sqlx::query_scalar::<_, bool>(
        "SELECT EXISTS (SELECT 1 FROM visits WHERE ip = $1 AND visited_at >= $2)",
    )
    .bind(ip)
    .bind(since)
    .fetch_one(pool)
    .await?;

    Ok(seen)
}

pub async fn insert_visit(pool: &PgPool, v: NewVisit) -> Result<(), ApiError> {
    sqlx::query(
        r#"
        INSERT INTO visits (
            ip, country_code, country_name, city,
            device, browser, os, user_agent,
            path, referrer, language, timezone, screen_width, theme,
            is_new_visitor
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)
        "#,
    )
    .bind(&v.ip)
    .bind(&v.country_code)
    .bind(&v.country_name)
    .bind(&v.city)
    .bind(&v.device)
    .bind(&v.browser)
    .bind(&v.os)
    .bind(&v.user_agent)
    .bind(&v.path)
    .bind(&v.referrer)
    .bind(&v.language)
    .bind(&v.timezone)
    .bind(v.screen_width)
    .bind(&v.theme)
    .bind(v.is_new_visitor)
    .execute(pool)
    .await?;

    Ok(())
}

// ── Read ──────────────────────────────────────────────────────────────────────

pub async fn count_visits(pool: &PgPool, days: Option<i32>) -> Result<i64, ApiError> {
    let sql = format!("SELECT COUNT(*) FROM visits WHERE {RANGE_FILTER}");
    let count = sqlx::query_scalar::<_, i64>(&sql)
        .bind(days)
        .fetch_one(pool)
        .await?;
    Ok(count)
}

pub async fn list_visits(
    pool: &PgPool,
    days: Option<i32>,
    limit: i32,
    offset: i32,
) -> Result<Vec<Visit>, ApiError> {
    let sql = format!(
        r#"
        SELECT id, visited_at, ip, country_code, country_name, city,
               device, browser, os, path, referrer, language, timezone, is_new_visitor
        FROM visits
        WHERE {RANGE_FILTER}
        ORDER BY visited_at DESC, id DESC
        LIMIT $2 OFFSET $3
        "#
    );
    let rows = sqlx::query_as::<_, Visit>(&sql)
        .bind(days)
        .bind(limit)
        .bind(offset)
        .fetch_all(pool)
        .await?;
    Ok(rows)
}

pub async fn totals(pool: &PgPool, days: Option<i32>) -> Result<TotalsRow, ApiError> {
    let sql = format!(
        r#"
        SELECT
            COUNT(*)                                                            AS total_visits,
            COUNT(DISTINCT ip)                                                  AS unique_visitors,
            COUNT(*) FILTER (WHERE visited_at::date = CURRENT_DATE)             AS visits_today,
            COUNT(*) FILTER (WHERE visited_at::date = CURRENT_DATE - 1)         AS visits_yesterday,
            COUNT(DISTINCT country_code) FILTER (WHERE country_code IS NOT NULL) AS countries_count,
            COUNT(*) FILTER (WHERE is_new_visitor)                              AS new_visitors
        FROM visits
        WHERE {RANGE_FILTER}
        "#
    );
    let row = sqlx::query_as::<_, TotalsRow>(&sql)
        .bind(days)
        .fetch_one(pool)
        .await?;
    Ok(row)
}

pub async fn daily_counts(pool: &PgPool, days: Option<i32>) -> Result<Vec<DailyCount>, ApiError> {
    let sql = format!(
        r#"
        SELECT visited_at::date AS date,
               COUNT(*)          AS visits,
               COUNT(DISTINCT ip) AS unique_visitors
        FROM visits
        WHERE {RANGE_FILTER}
        GROUP BY 1
        ORDER BY 1 ASC
        "#
    );
    let rows = sqlx::query_as::<_, DailyCount>(&sql)
        .bind(days)
        .fetch_all(pool)
        .await?;
    Ok(rows)
}

pub async fn top_countries(
    pool: &PgPool,
    days: Option<i32>,
    limit: i64,
) -> Result<Vec<CountryCount>, ApiError> {
    let sql = format!(
        r#"
        SELECT country_code,
               COALESCE(MAX(country_name), country_code) AS country_name,
               COUNT(*) AS count
        FROM visits
        WHERE {RANGE_FILTER} AND country_code IS NOT NULL
        GROUP BY country_code
        ORDER BY count DESC, country_code ASC
        LIMIT $2
        "#
    );
    let rows = sqlx::query_as::<_, CountryCount>(&sql)
        .bind(days)
        .bind(limit)
        .fetch_all(pool)
        .await?;
    Ok(rows)
}

/// Columns allowed in `top_by_column`. Interpolated into SQL, so this list is
/// the only thing standing between us and injection: keep it a closed set.
const TOP_COLUMNS: &[&str] = &["device", "browser", "referrer", "language", "path"];

pub async fn top_by_column(
    pool: &PgPool,
    column: &'static str,
    days: Option<i32>,
    limit: i64,
) -> Result<Vec<LabelledCount>, ApiError> {
    debug_assert!(TOP_COLUMNS.contains(&column));
    if !TOP_COLUMNS.contains(&column) {
        return Err(ApiError::InternalError);
    }

    let sql = format!(
        r#"
        SELECT {column} AS label, COUNT(*) AS count
        FROM visits
        WHERE {RANGE_FILTER} AND {column} IS NOT NULL
        GROUP BY {column}
        ORDER BY count DESC, label ASC
        LIMIT $2
        "#
    );
    let rows = sqlx::query_as::<_, LabelledCount>(&sql)
        .bind(days)
        .bind(limit)
        .fetch_all(pool)
        .await?;
    Ok(rows)
}
