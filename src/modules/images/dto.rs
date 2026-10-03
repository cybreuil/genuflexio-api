use serde::{Deserialize, Serialize};
use sqlx::FromRow;

#[derive(Debug, Deserialize)]
pub struct ImagesListQuery {
    pub page: Option<i32>,
    pub per_page: Option<i32>,
    pub language_code: Option<String>,
    pub q: Option<String>,
    pub sort: Option<String>, // e.g., "name_asc", "name_desc", "created_at_asc", "created_at_desc"
}

#[derive(Debug, Serialize, FromRow)]
pub struct SaintImageDetailed {
    pub id: i32,
    pub saint_id: i32,
    pub image_url: String,
    pub title: String,
    pub image_type: Option<String>,
    pub alt_text: Option<String>, // COALESCE(si.alt_text_override, i.alt_text)
    pub caption: Option<String>,  // COALESCE(si.caption_override, i.caption)
    pub creator: Option<String>,
    pub date_label: Option<String>,
    // pub century: Option<i16>, only used for query
    pub repository: Option<String>,
    pub credit: Option<String>,
    pub license: Option<String>,
    pub source_url: Option<String>,
    // pub sort_order: i16,
    // pub is_primary: bool,
    pub saint_name: Option<String>, // The name of the saint associated with the image
    pub saint_slug: Option<String>, // The slug of the saint associated with the image
                                    // We should maybe seed century quickly
}

#[derive(Debug, Deserialize)]
pub struct ImagesListWallQuery {
    pub limit: Option<i32>,
    pub offset: Option<i32>,
    pub language_code: Option<String>,
    pub q: Option<String>,
    pub saint_id: Option<i32>,
    pub artist: Option<String>,
    pub museum: Option<String>,
    pub century: Option<i32>,
    pub sort: Option<String>, // e.g., "name_asc", "name_desc", "created_at_asc", "created_at_desc"
    pub seed: Option<String>, // For randomization, if needed
}
#[derive(Debug, Serialize)]
pub struct ImageListWallResponse {
    pub data: Vec<SaintImageDetailed>,
    pub total: i32,
    pub has_more: bool,
}
