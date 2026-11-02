use argon2::{
    password_hash::{rand_core::OsRng, PasswordHash, PasswordHasher, PasswordVerifier, SaltString},
    Argon2,
};
use chrono::{Duration, Utc};
use jsonwebtoken::{encode, EncodingKey, Header};
use rand::RngCore;
use sha2::{Digest, Sha256};
use sqlx::PgPool;

use crate::core::error::ApiError;
use crate::middleware::auth::Claims;

use super::dto::{LoginRequest, LoginResponse, MeResponse};
use super::repo;

// ── Crypto helpers ────────────────────────────────────────────────────────────

pub fn hash_password(password: &str) -> Result<String, ApiError> {
    let salt = SaltString::generate(&mut OsRng);
    Argon2::default()
        .hash_password(password.as_bytes(), &salt)
        .map(|h| h.to_string())
        .map_err(|_| ApiError::InternalError)
}

pub fn verify_password(hash: &str, password: &str) -> bool {
    let Ok(parsed) = PasswordHash::new(hash) else {
        return false;
    };
    Argon2::default()
        .verify_password(password.as_bytes(), &parsed)
        .is_ok()
}

/// Generates a cryptographically random 32-byte token encoded as hex.
pub fn generate_refresh_token() -> String {
    let mut bytes = [0u8; 32];
    rand::rngs::OsRng.fill_bytes(&mut bytes);
    hex::encode(bytes)
}

/// SHA-256 of the raw token — this is what we store in the DB.
pub fn hash_token(token: &str) -> String {
    hex::encode(Sha256::digest(token.as_bytes()))
}

pub fn create_access_token(
    user_id: i32,
    role: &str,
    secret: &str,
    ttl_minutes: i64,
) -> Result<String, ApiError> {
    let exp = (Utc::now() + Duration::minutes(ttl_minutes)).timestamp() as usize;
    let claims = Claims {
        sub: user_id.to_string(),
        role: role.to_string(),
        exp,
    };
    encode(
        &Header::default(),
        &claims,
        &EncodingKey::from_secret(secret.as_bytes()),
    )
    .map_err(|_| ApiError::InternalError)
}

// ── Business logic ────────────────────────────────────────────────────────────

/// Returns `(LoginResponse, raw_refresh_token)`.
/// The raw token goes into the cookie; the hash goes into the DB.
pub async fn login(
    pool: &PgPool,
    req: LoginRequest,
    secret: &str,
    jwt_ttl: i64,
    refresh_days: i64,
) -> Result<(LoginResponse, String), ApiError> {
    let user = repo::find_user_by_email(pool, &req.email)
        .await?
        .ok_or(ApiError::Unauthorized)?;

    // if !user.is_active {
    //     return Err(ApiError::Unauthorized);
    // }

    if !verify_password(&user.password_hash, &req.password) {
        return Err(ApiError::Unauthorized);
    }

    let access_token = create_access_token(user.id, &user.role, secret, jwt_ttl)?;
    let refresh_token = generate_refresh_token();
    let expires_at = Utc::now() + Duration::days(refresh_days);

    repo::insert_refresh_token(pool, user.id, &hash_token(&refresh_token), expires_at).await?;
    // repo::touch_last_login(pool, user.id).await?;

    Ok((
        LoginResponse {
            access_token,
            token_type: "Bearer",
            expires_in: jwt_ttl * 60,
        },
        refresh_token,
    ))
}

/// Rotates the refresh token and issues a new access token.
/// If the incoming token is already revoked, all user sessions are killed
/// (replay attack prevention).
pub async fn refresh(
    pool: &PgPool,
    raw_token: &str,
    secret: &str,
    jwt_ttl: i64,
    refresh_days: i64,
) -> Result<(LoginResponse, String), ApiError> {
    let token_row = repo::find_refresh_token(pool, &hash_token(raw_token))
        .await?
        .ok_or(ApiError::Unauthorized)?;

    if token_row.revoked {
        // Possible replay — nuke every session for this user
        repo::revoke_all_user_tokens(pool, token_row.user_id).await?;
        return Err(ApiError::Unauthorized);
    }

    if Utc::now() > token_row.expires_at {
        return Err(ApiError::Unauthorized);
    }

    let user = repo::find_user_by_id(pool, token_row.user_id)
        .await?
        .ok_or(ApiError::Unauthorized)?;

    // if !user.is_active {
    //     return Err(ApiError::Unauthorized);
    // }

    // Rotate: revoke old token, issue a fresh one
    repo::revoke_refresh_token(pool, token_row.id).await?;
    let new_token = generate_refresh_token();
    let expires_at = Utc::now() + Duration::days(refresh_days);
    repo::insert_refresh_token(pool, user.id, &hash_token(&new_token), expires_at).await?;

    let access_token = create_access_token(user.id, &user.role, secret, jwt_ttl)?;

    Ok((
        LoginResponse {
            access_token,
            token_type: "Bearer",
            expires_in: jwt_ttl * 60,
        },
        new_token,
    ))
}

/// Revokes the refresh token linked to the cookie (best-effort: no error if missing).
pub async fn logout(pool: &PgPool, raw_token: &str) -> Result<(), ApiError> {
    if let Some(row) = repo::find_refresh_token(pool, &hash_token(raw_token)).await? {
        repo::revoke_refresh_token(pool, row.id).await?;
    }
    Ok(())
}

pub async fn me(pool: &PgPool, user_id: i32) -> Result<MeResponse, ApiError> {
    let user = repo::find_user_by_id(pool, user_id)
        .await?
        .ok_or(ApiError::Unauthorized)?;

    Ok(MeResponse {
        id: user.id,
        email: user.email,
        role: user.role,
    })
}
