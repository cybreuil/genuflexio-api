use chrono::{DateTime, NaiveDate, Utc};
use serde::{Deserialize, Serialize};
use sqlx::FromRow;

// ── Requests ──────────────────────────────────────────────────────────────────

/// Body of `POST /visits`, sent by the front on first page load.
#[derive(Debug, Deserialize)]
pub struct VisitPayload {
    pub path: String,
    #[serde(default)]
    pub referrer: String,
    #[serde(default)]
    pub language: String,
    #[serde(default)]
    pub timezone: String,
    #[serde(default)]
    pub screen_width: Option<i32>,
    #[serde(default)]
    pub theme: String,
}

/// Request metadata that the server extracts itself (never trusted from the body).
#[derive(Debug)]
pub struct VisitMeta {
    pub ip: String,
    pub user_agent: Option<String>,
    /// From the reverse proxy if it provides one (e.g. Cloudflare `CF-IPCountry`).
    pub country_code: Option<String>,
}

#[derive(Debug, Clone, Copy, Deserialize, Serialize, PartialEq, Eq)]
#[serde(rename_all = "lowercase")]
pub enum VisitsRange {
    #[serde(rename = "7d")]
    Last7Days,
    #[serde(rename = "30d")]
    Last30Days,
    #[serde(rename = "90d")]
    Last90Days,
    All,
}

impl Default for VisitsRange {
    fn default() -> Self {
        Self::Last30Days
    }
}

impl VisitsRange {
    /// Number of days covered by the range, `None` meaning "no lower bound".
    pub fn days(self) -> Option<i32> {
        match self {
            Self::Last7Days => Some(7),
            Self::Last30Days => Some(30),
            Self::Last90Days => Some(90),
            Self::All => None,
        }
    }
}

#[derive(Debug, Deserialize)]
pub struct VisitsListQuery {
    pub page: Option<i32>,
    pub per_page: Option<i32>,
    #[serde(default)]
    pub range: VisitsRange,
}

#[derive(Debug, Deserialize)]
pub struct VisitsStatsQuery {
    #[serde(default)]
    pub range: VisitsRange,
}

/// `DELETE /visits?older_than=90d` — purges visits *older* than the range.
/// `older_than=all` wipes the whole table. Defaults to `90d` as a safety net.
#[derive(Debug, Deserialize)]
pub struct VisitsPurgeQuery {
    #[serde(default = "VisitsPurgeQuery::default_older_than")]
    pub older_than: VisitsRange,
}

impl VisitsPurgeQuery {
    fn default_older_than() -> VisitsRange {
        VisitsRange::Last90Days
    }
}

#[derive(Debug, Serialize)]
pub struct VisitsPurgeResponse {
    pub older_than: VisitsRange,
    pub deleted: u64,
}

// ── Responses ─────────────────────────────────────────────────────────────────

#[derive(Debug, Serialize, FromRow)]
pub struct Visit {
    pub id: i32,
    pub visited_at: DateTime<Utc>,
    pub ip: String,
    pub country_code: Option<String>,
    pub country_name: Option<String>,
    pub city: Option<String>,
    pub device: String,
    pub browser: Option<String>,
    pub os: Option<String>,
    pub path: String,
    pub referrer: Option<String>,
    pub language: Option<String>,
    pub timezone: Option<String>,
    pub is_new_visitor: bool,
    pub theme: Option<String>,
}

#[derive(Debug, Serialize, FromRow)]
pub struct DailyCount {
    pub date: NaiveDate,
    pub visits: i64,
    pub unique_visitors: i64,
}

#[derive(Debug, Serialize, FromRow)]
pub struct LabelledCount {
    pub label: String,
    pub count: i64,
}

#[derive(Debug, Serialize, FromRow)]
pub struct CountryCount {
    pub country_code: String,
    pub country_name: String,
    pub count: i64,
}

/// Row returned by the single "totals" aggregate query.
#[derive(Debug, FromRow)]
pub struct TotalsRow {
    pub total_visits: i64,
    pub unique_visitors: i64,
    pub visits_today: i64,
    pub visits_yesterday: i64,
    pub countries_count: i64,
    pub new_visitors: i64,
}

#[derive(Debug, Serialize)]
pub struct VisitStats {
    pub range: VisitsRange,
    pub total_visits: i64,
    pub unique_visitors: i64,
    pub visits_today: i64,
    pub visits_yesterday: i64,
    pub countries_count: i64,
    pub new_visitors_ratio: f64,
    pub daily: Vec<DailyCount>,
    pub top_countries: Vec<CountryCount>,
    pub top_devices: Vec<LabelledCount>,
    pub top_browsers: Vec<LabelledCount>,
    pub top_referrers: Vec<LabelledCount>,
    pub top_languages: Vec<LabelledCount>,
    pub top_paths: Vec<LabelledCount>,
}
