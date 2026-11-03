use crate::core::error::ApiError;
use actix_web::HttpRequest;
use jsonwebtoken::{decode, DecodingKey, Validation};
use serde::{Deserialize, Serialize};

// JWT payload
#[derive(Debug, Serialize, Deserialize)]
pub struct Claims {
    pub sub: String,
    pub role: String,
    pub exp: usize,
}

/// Extract and validate a JWT Bearer token from the Authorization header.
/// Returns the decoded claims on success, or an ApiError on failure.
pub fn require_auth(req: &HttpRequest, jwt_secret: &str) -> Result<Claims, ApiError> {
    let auth_header = req
        .headers()
        .get("Authorization")
        .and_then(|v| v.to_str().ok())
        .ok_or(ApiError::Unauthorized)?;

    let token = auth_header
        .strip_prefix("Bearer ")
        .ok_or(ApiError::Unauthorized)?;

    let token_data = decode::<Claims>(
        token,
        &DecodingKey::from_secret(jwt_secret.as_bytes()),
        &Validation::default(),
    )
    .map_err(|_| ApiError::Unauthorized)?;

    Ok(token_data.claims)
}

pub fn require_admin(req: &HttpRequest, jwt_secret: &str) -> Result<Claims, ApiError> {
    let claims = require_auth(req, jwt_secret)?;
    if claims.role != "admin" {
        return Err(ApiError::Forbidden);
    }
    Ok(claims)
}
