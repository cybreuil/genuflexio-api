use serde::Serialize;

const DEFAULT_PAGE: i32 = 1;
const DEFAULT_PER_PAGE: i32 = 20;
const MAX_PER_PAGE: i32 = 100;

/// Parsed and clamped pagination parameters, ready for use in SQL queries.
#[derive(Debug, Clone, Copy)]
pub struct Pagination {
    pub page: i32,
    pub per_page: i32,
    pub offset: i32,
}

impl Pagination {
    pub fn new(page: Option<i32>, per_page: Option<i32>) -> Self {
        let page = page.unwrap_or(DEFAULT_PAGE).max(1);
        let per_page = per_page
            .unwrap_or(DEFAULT_PER_PAGE)
            .max(1)
            .min(MAX_PER_PAGE);
        let offset = (page - 1) * per_page;
        Self {
            page,
            per_page,
            offset,
        }
    }

    pub fn beyond_total(&self, total: i32) -> bool {
        self.offset >= total
    }

    /// Calculates the total number of pages for a given total count.
    pub fn total_pages(&self, total: i32) -> i32 {
        if total == 0 {
            0
        } else {
            (total + self.per_page - 1) / self.per_page
        }
    }
}

/// Generic paginated response wrapper.
#[derive(Debug, Serialize)]
// #[serde(rename_all = "camelCase")]
pub struct Paginated<T, C = ()> {
    pub page: i32,
    pub per_page: i32,
    pub total: i32,
    pub total_pages: i32,

    #[serde(skip_serializing_if = "Option::is_none")]
    pub context: Option<C>,

    pub data: Vec<T>,
}

impl<T, C> Paginated<T, C> {
    /// Constructs a paginated response from pagination parameters and data.
    pub fn new(pagination: &Pagination, total: i32, data: Vec<T>) -> Self {
        Self {
            page: pagination.page,
            per_page: pagination.per_page,
            total,
            total_pages: pagination.total_pages(total),
            context: None,
            data,
        }
    }

    /// Shortcut for an empty page (e.g. base empty, not found, etc.).
    pub fn empty(pagination: &Pagination) -> Self {
        Self {
            page: pagination.page,
            per_page: pagination.per_page,
            total: 0,
            total_pages: 0,
            context: None,
            data: Vec::new(),
        }
    }

    pub fn with_context(pagination: &Pagination, total: i32, context: C, data: Vec<T>) -> Self {
        Self {
            page: pagination.page,
            per_page: pagination.per_page,
            total,
            total_pages: pagination.total_pages(total),
            context: Some(context),
            data,
        }
    }

    pub fn empty_with_context(pagination: &Pagination, context: C) -> Self {
        Self {
            page: pagination.page,
            per_page: pagination.per_page,
            total: 0,
            total_pages: 0,
            context: Some(context),
            data: Vec::new(),
        }
    }
}
