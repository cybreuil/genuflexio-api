use serde::{Deserialize, Serialize};

// ── Requests ──────────────────────────────────────────────────────────────────

#[derive(Deserialize)]
pub struct LoginRequest {
    pub email: String,
    pub password: String,
}

// ── Responses ─────────────────────────────────────────────────────────────────

#[derive(Serialize)]
pub struct LoginResponse {
    pub access_token: String,
    pub token_type: &'static str,
    pub expires_in: i64, // seconds
    pub user: MeResponse,
}

#[derive(Serialize)]
pub struct MeResponse {
    pub id: i32,
    pub email: String,
    pub role: String,
}
