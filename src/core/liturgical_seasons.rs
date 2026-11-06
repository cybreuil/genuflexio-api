use crate::core::error::ApiError;
use crate::core::movable_dates::{resolve_movable_date, LiturgicalConfig, MovableBase};
use chrono::NaiveDate;

#[derive(Debug, sqlx::FromRow, Clone)]
pub struct LiturgicalSeasonIntervalRow {
    pub season_code: String,
    pub segment_index: i16,

    pub start_kind: String,
    pub start_month: Option<i16>,
    pub start_day: Option<i16>,
    pub start_movable_base: Option<String>,
    pub start_offset_days: Option<i16>,

    pub end_kind: String,
    pub end_month: Option<i16>,
    pub end_day: Option<i16>,
    pub end_movable_base: Option<String>,
    pub end_offset_days: Option<i16>,

    pub label: Option<String>, // season label
    pub color_code: Option<String>,
    pub color_label: Option<String>,
    pub hex_color: Option<String>,
}

#[derive(Debug, Clone)]
pub struct SeasonInterval {
    pub code: String,
    pub segment_index: i16,
    pub label: Option<String>,
    pub start: NaiveDate,
    pub end: NaiveDate,
    pub color_code: Option<String>,
    pub color_label: Option<String>,
    pub hex_color: Option<String>,
}

fn resolve_boundary(
    kind: &str,
    month: Option<i16>,
    day: Option<i16>,
    movable_base: Option<&str>,
    offset_days: Option<i16>,
    year: i32,
    config: LiturgicalConfig,
) -> Result<NaiveDate, ApiError> {
    match kind {
        "fixed" => {
            let m = month.ok_or(ApiError::InternalError)? as u32;
            let d = day.ok_or(ApiError::InternalError)? as u32;

            NaiveDate::from_ymd_opt(year, m, d).ok_or(ApiError::InternalError)
        }

        "movable" => {
            let base = MovableBase::try_from(movable_base.ok_or(ApiError::InternalError)?)
                .map_err(|_| ApiError::InternalError)?;

            Ok(resolve_movable_date(
                year,
                base,
                offset_days.unwrap_or(0),
                config,
            ))
        }

        _ => Err(ApiError::InternalError),
    }
}

fn build_occurrence(
    row: &LiturgicalSeasonIntervalRow,
    anchor_year: i32,
    config: LiturgicalConfig,
) -> Result<(NaiveDate, NaiveDate), ApiError> {
    let start = resolve_boundary(
        &row.start_kind,
        row.start_month,
        row.start_day,
        row.start_movable_base.as_deref(),
        row.start_offset_days,
        anchor_year,
        config,
    )?;

    let end_same_year = resolve_boundary(
        &row.end_kind,
        row.end_month,
        row.end_day,
        row.end_movable_base.as_deref(),
        row.end_offset_days,
        anchor_year,
        config,
    )?;

    let end = if end_same_year >= start {
        end_same_year
    } else {
        resolve_boundary(
            &row.end_kind,
            row.end_month,
            row.end_day,
            row.end_movable_base.as_deref(),
            row.end_offset_days,
            anchor_year + 1,
            config,
        )?
    };

    Ok((start, end))
}

// We now use intersect to keep real dates
// fn overlap_with_year(
//     start: NaiveDate,
//     end: NaiveDate,
//     year_start: NaiveDate,
//     year_end: NaiveDate,
// ) -> Option<(NaiveDate, NaiveDate)> {
//     let start = start.max(year_start);
//     let end = end.min(year_end);

//     (start <= end).then_some((start, end))
// }

/// True if the occurrence [start, end] (inclusive) touches the civil year.
/// The bounds are never clipped: a season that overlaps December 31st is
/// returned whole, so `start`/`end` are always the real liturgical bounds.
fn intersects_year(
    start: NaiveDate,
    end: NaiveDate,
    year_start: NaiveDate,
    year_end: NaiveDate,
) -> bool {
    start <= year_end && end >= year_start
}

pub fn build_intervals(
    rows: &[LiturgicalSeasonIntervalRow],
    year: i32,
    config: LiturgicalConfig,
) -> Result<Vec<SeasonInterval>, ApiError> {
    let year_start = NaiveDate::from_ymd_opt(year, 1, 1).ok_or(ApiError::InternalError)?;
    let year_end = NaiveDate::from_ymd_opt(year, 12, 31).ok_or(ApiError::InternalError)?;
    let mut intervals = Vec::with_capacity(rows.len() * 2);

    for row in rows {
        // A season anchored in year-1 may spill into this year (Christmastide),
        // and one anchored in this year may spill into year+1. Both anchors are
        // evaluated; each occurrence is kept whole if it touches the civil year.
        let anchors = if year > 1 {
            vec![year - 1, year]
        } else {
            vec![year]
        };

        for anchor_year in anchors {
            let (start, end) = build_occurrence(row, anchor_year, config)?;

            if intersects_year(start, end, year_start, year_end) {
                intervals.push(SeasonInterval {
                    code: row.season_code.clone(),
                    segment_index: row.segment_index,
                    label: row.label.clone(),
                    start,
                    end,
                    color_code: row.color_code.clone(),
                    color_label: row.color_label.clone(),
                    hex_color: row.hex_color.clone(),
                });
            }
        }
    }

    intervals.sort_by(|a, b| {
        a.start
            .cmp(&b.start)
            .then(b.end.cmp(&a.end)) // longest first when same start (LENT 0 before LENT 1 in 1960)
            .then_with(|| a.code.cmp(&b.code))
            .then(a.segment_index.cmp(&b.segment_index))
    });

    Ok(intervals)
}

#[cfg(test)]
mod tests {
    use super::{build_intervals, LiturgicalSeasonIntervalRow};
    use crate::core::movable_dates::LiturgicalConfig;
    use chrono::NaiveDate;

    fn fixed_row(
        season_code: &str,
        segment_index: i16,
        start_month: i16,
        start_day: i16,
        end_month: i16,
        end_day: i16,
    ) -> LiturgicalSeasonIntervalRow {
        LiturgicalSeasonIntervalRow {
            season_code: season_code.to_string(),
            segment_index,
            start_kind: "fixed".to_string(),
            start_month: Some(start_month),
            start_day: Some(start_day),
            start_movable_base: None,
            start_offset_days: None,
            end_kind: "fixed".to_string(),
            end_month: Some(end_month),
            end_day: Some(end_day),
            end_movable_base: None,
            end_offset_days: None,
            label: Some(season_code.to_string()),
            color_code: None,
            color_label: None,
            hex_color: None,
        }
    }

    #[test]
    fn build_intervals_keeps_cross_year_intervals_whole() {
        let rows = vec![
            fixed_row("CHRISTMASTIDE", 0, 12, 25, 1, 11),
            fixed_row("ORDINARY_TIME", 0, 1, 12, 2, 17),
            fixed_row("ORDINARY_TIME", 1, 5, 25, 11, 28),
        ];
        let intervals = build_intervals(&rows, 2026, LiturgicalConfig::default()).unwrap();

        assert_eq!(intervals.len(), 4);

        // Christmastide anchored in 2025, whole, not clipped to 2026-01-01
        assert_eq!(intervals[0].code, "CHRISTMASTIDE");
        assert_eq!(intervals[0].segment_index, 0);
        assert_eq!(
            intervals[0].start,
            NaiveDate::from_ymd_opt(2025, 12, 25).unwrap()
        );
        assert_eq!(
            intervals[0].end,
            NaiveDate::from_ymd_opt(2026, 1, 11).unwrap()
        );

        assert_eq!(intervals[1].code, "ORDINARY_TIME");
        assert_eq!(intervals[1].segment_index, 0);

        assert_eq!(intervals[2].code, "ORDINARY_TIME");
        assert_eq!(intervals[2].segment_index, 1);

        // Christmastide anchored in 2026, whole, not clipped to 2026-12-31,
        // and segment_index stays 0 (it is the same season, not a second segment)
        assert_eq!(intervals[3].code, "CHRISTMASTIDE");
        assert_eq!(intervals[3].segment_index, 0);
        assert_eq!(
            intervals[3].start,
            NaiveDate::from_ymd_opt(2026, 12, 25).unwrap()
        );
        assert_eq!(
            intervals[3].end,
            NaiveDate::from_ymd_opt(2027, 1, 11).unwrap()
        );
    }

    #[test]
    fn build_intervals_preserves_db_segment_index_when_same_start() {
        // 1960 calendar: LENT 0 (full) and LENT 1 (Lent proper) share the same start.
        let rows = vec![
            fixed_row("LENT", 0, 2, 18, 4, 4),
            fixed_row("LENT", 1, 2, 18, 3, 21),
        ];
        let intervals = build_intervals(&rows, 2026, LiturgicalConfig::default()).unwrap();

        assert_eq!(intervals[0].segment_index, 0);
        assert_eq!(intervals[1].segment_index, 1);
    }
}
