use serde::Serialize;
use sqlx::FromRow;

#[derive(Debug, Serialize, FromRow)]
pub struct Facet {
    pub value: String,
    pub label: String,
    pub count: i64,
}

/// `?include_facets=1` / `=true` → true. Absent ou autre → false.
pub fn wants_facets(raw: Option<&str>) -> bool {
    matches!(raw, Some("1") | Some("true"))
}
