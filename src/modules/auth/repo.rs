use chrono::{DateTime, Utc};
use sqlx::PgPool;

use crate::core::error::ApiError;

// ── DB row structs ────────────────────────────────────────────────────────────

#[derive(sqlx::FromRow)]
pub struct UserRow {
    pub id: i32,
    pub email: String,
    pub password_hash: String,
    pub role: String,
    // pub is_active: bool,
}

#[derive(sqlx::FromRow)]
pub struct RefreshTokenRow {
    pub id: i32,
    pub user_id: i32,
    pub expires_at: DateTime<Utc>,
    pub revoked: bool,
}

// ── Users ─────────────────────────────────────────────────────────────────────

pub async fn find_user_by_email(pool: &PgPool, email: &str) -> Result<Option<UserRow>, ApiError> {
    let row = sqlx::query_as::<_, UserRow>(
        "SELECT id, email, password_hash, role FROM users WHERE email = $1",
    )
    .bind(email)
    .fetch_optional(pool)
    .await?;

    Ok(row)
}

pub async fn find_user_by_id(pool: &PgPool, id: i32) -> Result<Option<UserRow>, ApiError> {
    let row = sqlx::query_as::<_, UserRow>(
        "SELECT id, email, password_hash, role FROM users WHERE id = $1",
    )
    .bind(id)
    .fetch_optional(pool)
    .await?;

    Ok(row)
}

// pub async fn touch_last_login(pool: &PgPool, user_id: i32) -> Result<(), ApiError> {
//     sqlx::query("UPDATE users SET last_login_at = now() WHERE id = $1")
//         .bind(user_id)
//         .execute(pool)
//         .await?;

//     Ok(())
// }

// ── Refresh tokens ────────────────────────────────────────────────────────────

pub async fn insert_refresh_token(
    pool: &PgPool,
    user_id: i32,
    token_hash: &str,
    expires_at: DateTime<Utc>,
) -> Result<(), ApiError> {
    sqlx::query("INSERT INTO refresh_tokens (user_id, token_hash, expires_at) VALUES ($1, $2, $3)")
        .bind(user_id)
        .bind(token_hash)
        .bind(expires_at)
        .execute(pool)
        .await?;

    Ok(())
}

pub async fn find_refresh_token(
    pool: &PgPool,
    token_hash: &str,
) -> Result<Option<RefreshTokenRow>, ApiError> {
    let row = sqlx::query_as::<_, RefreshTokenRow>(
        "SELECT id, user_id, expires_at, revoked FROM refresh_tokens WHERE token_hash = $1",
    )
    .bind(token_hash)
    .fetch_optional(pool)
    .await?;

    Ok(row)
}

pub async fn revoke_refresh_token(pool: &PgPool, token_id: i32) -> Result<(), ApiError> {
    sqlx::query("UPDATE refresh_tokens SET revoked = true WHERE id = $1")
        .bind(token_id)
        .execute(pool)
        .await?;

    Ok(())
}

/// Revoke every active session for a user — called on suspected replay attack.
pub async fn revoke_all_user_tokens(pool: &PgPool, user_id: i32) -> Result<(), ApiError> {
    sqlx::query("UPDATE refresh_tokens SET revoked = true WHERE user_id = $1")
        .bind(user_id)
        .execute(pool)
        .await?;

    Ok(())
}
