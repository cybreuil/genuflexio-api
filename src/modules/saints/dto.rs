use crate::core::facets::Facet;
use sqlx::FromRow;

// use chrono::NaiveDate;
use serde::{Deserialize, Serialize};

// Saint small struct for listing
#[derive(Debug, Serialize, FromRow)]
pub struct SaintListItem {
    pub id: i32,
    pub slug: String,
    pub default_name: String,
    pub birth_year: Option<i16>,
    pub death_year: Option<i16>,
}

#[derive(Debug, Serialize, FromRow)]
pub struct SaintListItemComplete {
    pub id: i32,
    pub slug: String,
    pub default_name: String,
    pub century: Option<i16>,
    pub name: Option<String>,
    pub image_url: Option<String>,
}

#[derive(Debug, Deserialize)]
pub struct SaintsListQuery {
    pub page: Option<i32>,
    pub per_page: Option<i32>,
    pub language_code: Option<String>,
    pub century: Option<i16>,
    pub q: Option<String>,
    pub sort: Option<String>,
    /// Comma-separated attribute codes, e.g. "VIRGIN,MARTYR". All must match (AND).
    pub attributes: Option<String>,
    /// Comma-separated patronage codes. All must match (AND).
    pub patronages: Option<String>,
    pub include_facets: Option<String>,
}

#[derive(Debug, Serialize)]
pub struct SaintFacets {
    pub century: Vec<Facet>,
    pub title: Vec<Facet>,
    pub order: Vec<Facet>,
    pub symbol: Vec<Facet>,
    pub patronage: Vec<Facet>,
}

#[derive(Debug, Serialize, FromRow)]
pub struct SaintDetail {
    pub id: i32,
    pub slug: String,
    pub default_name: String,
    pub birth_year: Option<i16>,
    pub birth_month: Option<i16>,
    pub birth_day: Option<i16>,
    pub birth_is_approximate: Option<bool>,
    pub death_year: Option<i16>,
    pub death_month: Option<i16>,
    pub death_day: Option<i16>,
    pub death_is_approximate: Option<bool>,
    pub century: Option<i16>,
    pub name: Option<String>,
    pub short_description: Option<String>,
    pub full_biography: Option<String>,
}

// One image as exposed in the saint detail response.
// Override columns from saint_images take precedence over the image defaults.
#[derive(Debug, Serialize, FromRow)]
pub struct SaintImage {
    pub id: i32,
    pub saint_id: i32,
    pub image_url: String,
    pub title: String,
    pub image_type: Option<String>,
    pub alt_text: Option<String>, // COALESCE(si.alt_text_override, i.alt_text)
    pub caption: Option<String>,  // COALESCE(si.caption_override, i.caption)
    pub creator: Option<String>,
    pub date_label: Option<String>,
    pub repository: Option<String>,
    pub credit: Option<String>,
    pub license: Option<String>,
    pub source_url: Option<String>,
    pub sort_order: i16,
    pub is_primary: bool,
}

#[derive(Debug, Serialize, FromRow)]
pub struct SaintAttribute {
    pub code: String,
    pub category: String,
    pub label: String,               // from attribute_translations
    pub description: Option<String>, // from attribute_translations
}

/// A location associated with a saint.
#[derive(Debug, Serialize, FromRow)]
pub struct SaintPlace {
    pub role: String,
    pub code: String,
    pub country_code: String,
    pub latitude: f64,
    pub longitude: f64,
    pub name: String,
}

#[derive(Debug, Serialize, FromRow)]
pub struct SaintPatronage {
    pub code: String,
    pub label: Option<String>,
    pub description: Option<String>,
}

// Final full-detailled response for slug
#[derive(Debug, Serialize)]
pub struct SaintDetailResponse {
    #[serde(flatten)]
    pub saint: SaintDetail,
    pub images: Vec<SaintImage>,
    pub places: Vec<SaintPlace>,
    pub attributes: Vec<SaintAttribute>,
    pub patronages: Vec<SaintPatronage>,
}

#[derive(Debug, Deserialize)]
pub struct LangQuery {
    pub language_code: Option<String>,
}

// Query for the random endpoint, returns a list of random images
#[derive(Debug, Deserialize)]
pub struct RandomImagesQuery {
    pub count: Option<i32>,
}

// #[derive(Debug, Deserialize)]
// pub struct CreateSaint {
//     pub slug: String,
//     pub default_name: String,
//     pub birth_date: Option<NaiveDate>,
//     pub death_date: Option<NaiveDate>,
//     pub short_description: Option<String>,
//     pub image_url: Option<String>,
// }

// #[derive(Debug, Deserialize)]
// pub struct UpdateSaint {
//     pub default_name: Option<String>,
//     pub birth_date: Option<NaiveDate>,
//     pub death_date: Option<NaiveDate>,
//     pub short_description: Option<String>,
//     pub image_url: Option<String>,
// }
