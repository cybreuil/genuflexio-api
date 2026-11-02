use crate::modules::liturgical_seasons::LiturgicalSeasonResponse;
use serde::{Deserialize, Serialize};
use sqlx::FromRow;

#[derive(Debug, Deserialize)]
pub struct CelebrationByDateQuery {
    pub year: Option<i32>,
    pub month: Option<i16>,
    pub day: Option<i16>,
    pub calendar_code: Option<String>,
    pub language_code: Option<String>,
}

#[derive(Debug, Serialize)]
pub struct CelebrationByDateContext {
    pub year: i32,
    pub month: i16,
    pub day: i16,
    pub language_code: String,
    pub calendar_code: String,
}

// Depends on LiturgicalSeasonResponse, which is defined in the liturgical_seasons module
#[derive(Debug, Serialize)]
pub struct CelebrationByDateResponse {
    pub context: CelebrationByDateContext,
    pub liturgical_season: Option<LiturgicalSeasonResponse>,
    pub celebrations: Vec<CelebrationWithSaints>,
}

#[derive(Debug, Deserialize)]
pub struct CelebrationListQuery {
    pub page: Option<i32>,
    pub per_page: Option<i32>,
    pub calendar_code: Option<String>,
    pub language_code: Option<String>,
}

#[derive(Debug, Serialize, FromRow)]
pub struct SaintRow {
    pub feast_id: i32,
    pub saint_id: i32,
    pub saint_slug: String,
    pub saint_name: String,
    pub saint_century: Option<i16>,
    pub saint_life_label: Option<String>,
    pub saint_image_url: Option<String>,
}
#[derive(Debug, Serialize)]
pub struct Saint {
    pub saint_id: i32,
    pub saint_slug: String,
    pub saint_name: String,
    pub saint_century: Option<i16>,
    pub saint_life_label: Option<String>,
    pub saint_image_url: Option<String>,
}
impl From<SaintRow> for Saint {
    fn from(row: SaintRow) -> Self {
        Self {
            saint_id: row.saint_id,
            saint_slug: row.saint_slug,
            saint_name: row.saint_name,
            saint_century: row.saint_century,
            saint_life_label: row.saint_life_label,
            saint_image_url: row.saint_image_url,
        }
    }
}

#[derive(Debug, Serialize, FromRow)]
pub struct LiturgicalRankRow {
    pub id: i32,
    pub code: String,
    pub precedence: i16,
    pub label: String,
}

#[derive(Debug, Serialize, FromRow)]
pub struct CelebrationRow {
    pub id: i32,
    pub is_optional: bool,
    pub rank_id: i32,
    pub feast_id: i32,
    pub date_kind: Option<String>,
    pub month: Option<i16>,
    pub day: Option<i16>,
    pub movable_base: Option<String>,
    pub movable_offset_days: Option<i16>,
    pub notes: Option<String>,
    pub observance_type: Option<String>,
    pub default_name: Option<String>,
    pub feast_type: Option<String>,
    pub feast_name: Option<String>,
    pub feast_description: Option<String>,
    pub feast_cover_image_id: Option<i32>,
    pub feast_cover_image_url: Option<String>,
    pub liturgical_color_name: Option<String>,
    pub liturgical_color_hex: Option<String>,
    pub rank_code: Option<String>,
    pub rank_precedence: Option<i16>,
    pub rank_label: Option<String>,
}

#[derive(Debug, Serialize)]
pub struct CelebrationWithSaints {
    pub id: Option<i32>,
    pub is_optional: bool,
    pub notes: Option<String>,
    pub observance_type: Option<String>,
    pub default_name: Option<String>,
    pub feast_id: Option<i32>,
    pub feast_type: Option<String>,
    pub feast_name: Option<String>,
    pub feast_description: Option<String>,
    pub feast_cover_image_id: Option<i32>,
    pub feast_cover_image_url: Option<String>,
    pub liturgical_color_name: Option<String>,
    pub liturgical_color_hex: Option<String>,
    pub rank_id: i32,
    pub rank_code: Option<String>,
    pub rank_precedence: Option<i16>,
    pub rank_label: Option<String>,
    pub saints: Vec<Saint>,
}
impl CelebrationWithSaints {
    pub fn from(row: CelebrationRow, saints: Vec<Saint>) -> Self {
        Self {
            id: Some(row.id),
            is_optional: row.is_optional,
            notes: row.notes,
            observance_type: row.observance_type,
            default_name: row.default_name,
            feast_id: Some(row.feast_id),
            feast_type: row.feast_type,
            feast_name: row.feast_name,
            feast_description: row.feast_description,
            feast_cover_image_id: row.feast_cover_image_id,
            feast_cover_image_url: row.feast_cover_image_url,
            liturgical_color_name: row.liturgical_color_name,
            liturgical_color_hex: row.liturgical_color_hex,
            rank_id: row.rank_id,
            rank_code: row.rank_code,
            rank_precedence: row.rank_precedence,
            rank_label: row.rank_label,
            saints,
        }
    }
}
impl CelebrationWithSaints {
    pub fn feria(label: String, rank: LiturgicalRankRow, feast_type: String) -> Self {
        Self {
            id: None,
            is_optional: false,
            notes: None,
            observance_type: Some("normal".to_string()),
            default_name: Some(label.clone()),
            feast_id: None,
            feast_type: Some(feast_type),
            feast_name: Some(label),
            feast_description: None,
            feast_cover_image_id: None,
            feast_cover_image_url: None,
            liturgical_color_name: None,
            liturgical_color_hex: None,
            rank_id: rank.id,
            rank_code: Some(rank.code),
            rank_precedence: Some(rank.precedence),
            rank_label: Some(rank.label),
            saints: vec![],
        }
    }
}
