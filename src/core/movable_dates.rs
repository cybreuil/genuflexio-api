use chrono::{Datelike, Duration, NaiveDate, Weekday};
use serde::{Deserialize, Serialize};

// List of actual movable dates
// EASTER_SUNDAY
// PALM_SUNDAY
// DIVINE_MERCY_SUNDAY
// PENTECOST
// TRINITY_SUNDAY
// SECOND_SUNDAY_AFTER_PENTECOST
// FIRST_ADVENT_SUNDAY
// SUNDAY_AFTER_EPIPHANY
// SUNDAY_WITHIN_CHRISTMAS_OCTAVE_OR_DEC30
// EPIPHANY  (France/Belgium/etc: Sunday between Jan 2–8; roman general or 1960 is fixed JAN 6)

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "SCREAMING_SNAKE_CASE")]
pub enum MovableBase {
    EasterSunday,
    PalmSunday,
    DivineMercySunday,
    Pentecost,
    TrinitySunday,
    SecondSundayAfterPentecost,
    FirstAdventSunday,
    SundayAfterEpiphany,
    SundayWithinChristmasOctaveOrDec30,
    BaptismOfTheLord,
    AshWednesday,
    HolyThursday,
    AscensionSunday,
    Epiphany,
    SaintJoseph, // March 19 (fixed), but if it is inside Holy Week, back to the Saturday before Palm Sunday
    Annunciation, // March 25 (fixed), but if it is inside Holy Week or Easter Octave, moved to Monday after the Octave of Easter
    ImmaculateConception, // December 8 (fixed), but if it falls on a Sunday (Advent Sunday), moved to December 9
    // Specific for 1960
    SeptuagesimaSunday,
    PassionSunday,
    SundayBetweenChristmasOctaveAndEpiphany,
    ChristTheKing,
}

impl TryFrom<&str> for MovableBase {
    type Error = ();

    fn try_from(value: &str) -> Result<Self, Self::Error> {
        match value {
            "EASTER_SUNDAY" => Ok(Self::EasterSunday),
            "PALM_SUNDAY" => Ok(Self::PalmSunday),
            "DIVINE_MERCY_SUNDAY" => Ok(Self::DivineMercySunday),
            "PENTECOST" => Ok(Self::Pentecost),
            "TRINITY_SUNDAY" => Ok(Self::TrinitySunday),
            "SECOND_SUNDAY_AFTER_PENTECOST" => Ok(Self::SecondSundayAfterPentecost),
            "FIRST_ADVENT_SUNDAY" => Ok(Self::FirstAdventSunday),
            "SUNDAY_AFTER_EPIPHANY" => Ok(Self::SundayAfterEpiphany),
            "SUNDAY_WITHIN_CHRISTMAS_OCTAVE_OR_DEC30" => {
                Ok(Self::SundayWithinChristmasOctaveOrDec30)
            }
            "BAPTISM_OF_THE_LORD" => Ok(Self::BaptismOfTheLord),
            "ASH_WEDNESDAY" => Ok(Self::AshWednesday),
            "HOLY_THURSDAY" => Ok(Self::HolyThursday),
            "ASCENSION_SUNDAY" => Ok(Self::AscensionSunday),
            "EPIPHANY" => Ok(Self::Epiphany),
            "SAINT_JOSEPH" => Ok(Self::SaintJoseph),
            "ANNUNCIATION" => Ok(Self::Annunciation),
            "IMMACULATE_CONCEPTION" => Ok(Self::ImmaculateConception),
            "SEPTUAGESIMA_SUNDAY" => Ok(Self::SeptuagesimaSunday),
            "PASSION_SUNDAY" => Ok(Self::PassionSunday),
            "SUNDAY_BETWEEN_CHRISTMAS_OCTAVE_AND_EPIPHANY" => {
                Ok(Self::SundayBetweenChristmasOctaveAndEpiphany)
            }
            "CHRIST_THE_KING" => Ok(Self::ChristTheKing),
            _ => Err(()),
        }
    }
}

// Not used
// impl MovableBase {
//     pub fn as_str(&self) -> &'static str {
//         match self {
//             Self::EasterSunday => "EASTER_SUNDAY",
//             Self::PalmSunday => "PALM_SUNDAY",
//             Self::DivineMercySunday => "DIVINE_MERCY_SUNDAY",
//             Self::Pentecost => "PENTECOST",
//             Self::TrinitySunday => "TRINITY_SUNDAY",
//             Self::SecondSundayAfterPentecost => "SECOND_SUNDAY_AFTER_PENTECOST",
//             Self::FirstAdventSunday => "FIRST_ADVENT_SUNDAY",
//             Self::SundayAfterEpiphany => "SUNDAY_AFTER_EPIPHANY",
//             Self::SundayWithinChristmasOctaveOrDec30 => "SUNDAY_WITHIN_CHRISTMAS_OCTAVE_OR_DEC30",
//             Self::BaptismOfTheLord => "BAPTISM_OF_THE_LORD",
//             Self::AshWednesday => "ASH_WEDNESDAY",
//             Self::HolyThursday => "HOLY_THURSDAY",
//             Self::AscensionSunday => "ASCENSION_SUNDAY",
//             Self::Epiphany => "EPIPHANY",
//             Self::SaintJoseph => "SAINT_JOSEPH",
//             Self::Annunciation => "ANNUNCIATION",
//             Self::ImmaculateConception => "IMMACULATE_CONCEPTION",
//             Self::SeptuagesimaSunday => "SEPTUAGESIMA_SUNDAY",
//             Self::PassionSunday => "PASSION_SUNDAY",
//             Self::SundayBetweenChristmasOctaveAndEpiphany => {
//                 "SUNDAY_BETWEEN_CHRISTMAS_OCTAVE_AND_EPIPHANY"
//             }
//             Self::ChristTheKing => "CHRIST_THE_KING",
//         }
//     }
// }

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum CalendarType {
    Gregorian,
    Julian,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum EpiphanyMode {
    FixedJan6,      // Epiphany is fixed on Jan 6 (Roman General, 1960, etc.)
    MovableJan2to8, // Epiphany is moved to the nearest Sunday in Jan 2–8 (France, Belgium, etc.)
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum ChristKingMode {
    LastSundayBeforeAdvent, // Christ the King is celebrated on the last Sunday before Advent (Roman General)
    LastSundayOfOctober,    // Christ the King is celebrated on the last Sunday of October (1962)
}

// Not used
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum AscensionMode {
    Thursday, // Ascension is celebrated on Thursday (traditional)
              // Sunday not used - commented for compiling
              // Sunday, // Ascension is celebrated on the following Sunday (some dioceses)
}

// Not used - commented for compiling
// #[derive(Debug, Clone, Copy, PartialEq)]
// pub enum CorpusChristiMode {
//     Thursday,
//     Sunday,
// }

// Global Configuration for liturgical calendar calculations, including calendar type and epiphany mode.
#[derive(Debug, Clone, Copy)]
pub struct LiturgicalConfig {
    pub calendar_type: CalendarType,
    pub epiphany_mode: EpiphanyMode,
    pub christ_king_mode: ChristKingMode,
    pub ascension_mode: AscensionMode,
    // pub corpus_christi_mode: CorpusChristiMode,
}
// Default configuration: Gregorian calendar with fixed Epiphany on Jan 6.
impl Default for LiturgicalConfig {
    fn default() -> Self {
        Self {
            calendar_type: CalendarType::Gregorian,
            epiphany_mode: EpiphanyMode::FixedJan6,
            christ_king_mode: ChristKingMode::LastSundayBeforeAdvent,
            ascension_mode: AscensionMode::Thursday,
            // corpus_christi_mode: CorpusChristiMode::Thursday,
        }
    }
}

/// Universal function to offset a date by a number of days. This can be used for any movable date.
pub fn offset(date: NaiveDate, days: i16) -> NaiveDate {
    date + Duration::days(days as i64)
}

/// Computes the date of Easter Sunday for the given year for the Gregorian calendar & Julian calendar.
///
/// Uses the Meeus/Jones/Butcher algorithm.
pub fn easter_sunday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    match config.calendar_type {
        CalendarType::Gregorian => {
            let a = year % 19;
            let b = year / 100;
            let c = year % 100;
            let d = b / 4;
            let e = b % 4;
            let f = (b + 8) / 25;
            let g = (b - f + 1) / 3;
            let h = (19 * a + b - d - g + 15) % 30;
            let i = c / 4;
            let k = c % 4;
            let l = (32 + 2 * e + 2 * i - h - k) % 7;
            let m = (a + 11 * h + 22 * l) / 451;

            let month = (h + l - 7 * m + 114) / 31;
            let day = ((h + l - 7 * m + 114) % 31) + 1;

            NaiveDate::from_ymd_opt(year, month as u32, day as u32)
                .expect("Failed to compute Gregorian Easter Sunday")
        }
        CalendarType::Julian => {
            let a = year % 4;
            let b = year % 7;
            let c = year % 19;
            let d = (19 * c + 15) % 30;
            let e = (2 * a + 4 * b - d + 34) % 7;
            let month = (d + e + 114) / 31;
            let day = ((d + e + 114) % 31) + 1;

            NaiveDate::from_ymd_opt(year, month as u32, day as u32)
                .expect("Failed to compute Julian Easter Sunday")
        }
    }
}

/// Returns the date of Palm Sunday for the given year.
/// Palm Sunday is the Sunday before Easter Sunday, which is 7 days before Easter.
pub fn palm_sunday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), -7)
}

/// Returns the date of Divine Mercy Sunday for the given year.
/// Divine Mercy Sunday is the Sunday after Easter Sunday, which is 7 days after Easter.
pub fn divine_mercy_sunday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), 7)
}

/// Returns the date of Pentecost for the given year.
/// Pentecost is the 50th day after Easter Sunday, which is 49 days after Easter.
pub fn pentecost(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), 49)
}

/// Returns the date of Trinity Sunday for the given year.
/// Trinity Sunday is the Sunday after Pentecost, which is 56 days after Easter.
pub fn trinity_sunday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), 56)
}

/// Returns the date of the Second Sunday after Pentecost.
pub fn second_sunday_after_pentecost(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), 63)
}

/// Returns the date of the First Sunday of Advent.
///
/// This is the Sunday falling between November 27 and December 3 inclusive.
pub fn first_advent_sunday(year: i32) -> NaiveDate {
    let mut date = NaiveDate::from_ymd_opt(year, 11, 27).unwrap();

    while date.weekday() != Weekday::Sun {
        date += Duration::days(1);
    }

    date
}

pub fn epiphany(year: i32, config: LiturgicalConfig) -> NaiveDate {
    match config.epiphany_mode {
        EpiphanyMode::FixedJan6 => NaiveDate::from_ymd_opt(year, 1, 6).unwrap(),
        EpiphanyMode::MovableJan2to8 => {
            let mut date = NaiveDate::from_ymd_opt(year, 1, 2).unwrap();

            while date.weekday() != Weekday::Sun {
                date += Duration::days(1);
            }

            date
        }
    }
}

// 1962: Epiphany is Jan 6, but Sunday After Epiphany logic may depend on rubrics...
pub fn sunday_after_epiphany(year: i32, config: LiturgicalConfig) -> NaiveDate {
    let epiphany_date = epiphany(year, config);
    let mut date = epiphany_date + Duration::days(1);

    while date.weekday() != Weekday::Sun {
        date += Duration::days(1);
    }

    date
}

/// Returns the Sunday within the Christmas Octave,
/// or December 30 if there is no Sunday.
///
/// The Christmas Octave is December 26–31.
pub fn sunday_within_christmas_octave_or_dec30(year: i32) -> NaiveDate {
    let mut date = NaiveDate::from_ymd_opt(year, 12, 26).unwrap();

    while date <= NaiveDate::from_ymd_opt(year, 12, 31).unwrap() {
        if date.weekday() == Weekday::Sun {
            return date;
        }
        date += Duration::days(1);
    }

    NaiveDate::from_ymd_opt(year, 12, 30).unwrap()
}

/// Returns the date of the Baptism of the Lord for the given year.
/// Sunday after Epiphany if epiphany fixed on Jan 6,
/// otherwise if epiphany is movable and falls on 7 or 8 Jan, then Baptism of the Lord is on the following Monday (9 or 10 Jan). If epiphany is on 2–6 Jan, then Baptism of the Lord is on the following Sunday (3–7 Jan).
pub fn baptism_of_the_lord(year: i32, config: LiturgicalConfig) -> NaiveDate {
    let epiphany = epiphany(year, config);

    if config.epiphany_mode == EpiphanyMode::MovableJan2to8 && epiphany.day() >= 7 {
        // Epiphany is on Jan 7 or 8, so Baptism of the Lord is on the following Monday (Jan 9 or 10) which means day + 1
        return epiphany + Duration::days(1);
    }

    // Otherwise, Baptism of the Lord is on the Sunday after Epiphany
    let days_until_sunday = 7 - epiphany.weekday().num_days_from_sunday();
    epiphany + Duration::days(days_until_sunday as i64)
}

// Not used right now so we comment it for compiling
// Returns the date of the first Sunday after the Baptism of the Lord for the given year.
// fn first_sunday_after_baptism(year: i32, config: LiturgicalConfig) -> NaiveDate {
//     let baptism = baptism_of_the_lord(year, config);
//
//     let mut date = baptism + Duration::days(1);
//
//     while date.weekday() != Weekday::Sun {
//         date += Duration::days(1);
//     }
//
//     date
// }

/// Returns the date of Ash Wednesday for the given year.
/// Ash Wednesday is 46 days before Easter Sunday (40 days of Lent + 6 Sundays).
pub fn ash_wednesday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), -46)
}

/// Returns the date of Holy Thursday for the given year.
/// Holy Thursday is 3 days before Easter Sunday.
pub fn holy_thursday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), -3)
}

/// Returns Ascension according to the configured calendar.
pub fn ascension_sunday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    match config.ascension_mode {
        AscensionMode::Thursday => offset(easter_sunday(year, config), 39),
        // AscensionMode::Sunday => offset(easter_sunday(year, config), 42),
    }
}

/// Returns the date of Christ the King for the given year.
/// Christ the King is the Sunday immediately before the First Sunday of Advent or the last Sunday of October, depending on the configuration.
pub fn christ_the_king(year: i32, config: LiturgicalConfig) -> NaiveDate {
    match config.christ_king_mode {
        ChristKingMode::LastSundayBeforeAdvent => {
            let first_advent = first_advent_sunday(year);
            offset(first_advent, -7)
        }
        ChristKingMode::LastSundayOfOctober => {
            let mut date = NaiveDate::from_ymd_opt(year, 10, 31).unwrap();

            while date.weekday() != Weekday::Sun {
                date -= Duration::days(1);
            }

            date
        }
    }
}

/// Returns the date of the Saint Joseph feast for the given year, considering the liturgical rules.
/// If March 19 falls within Holy Week, the feast is moved to the Saturday Before Palm Sunday. Otherwise, it is celebrated on March 19.
/// New rule: if saint joseph is on a Sunday, it is moved to the following Monday (March 20).
pub fn saint_joseph(year: i32, config: LiturgicalConfig) -> NaiveDate {
    let march_19 = NaiveDate::from_ymd_opt(year, 3, 19).unwrap();
    let palm_sunday = palm_sunday(year, config);
    let holy_week_end = palm_sunday + Duration::days(6); // Samedi Saint

    if march_19 >= palm_sunday && march_19 <= holy_week_end {
        palm_sunday - Duration::days(1)
    } else if march_19.weekday() == Weekday::Sun {
        march_19 + Duration::days(1)
    } else {
        march_19
    }
}

/// Returns the date of the Annunciation for the given year, considering the liturgical rules.
/// If March 25 falls within Holy Week or the Easter Octave, the feast is moved to the Monday after the Octave of Easter. Otherwise, it is celebrated on March 25.
pub fn annunciation(year: i32, config: LiturgicalConfig) -> NaiveDate {
    let march_25 = NaiveDate::from_ymd_opt(year, 3, 25).unwrap();

    let easter = easter_sunday(year, config);
    let palm_sunday = palm_sunday(year, config);

    let octave_end = easter + Duration::days(7); // samedi après Pâques

    if march_25 >= palm_sunday && march_25 <= octave_end {
        return easter + Duration::days(8); // lundi après le 2e dimanche de Pâques
    }

    march_25
}

/// Returns the date of the Immaculate Conception for the given year
/// It should be celebrated on December 8, but if it falls on a Sunday (Advent Sunday), it is moved to the following Monday (December 9).
pub fn immaculate_conception(year: i32) -> NaiveDate {
    let dec_8 = NaiveDate::from_ymd_opt(year, 12, 8).unwrap();
    let first_advent = first_advent_sunday(year);
    let fourth_advent = first_advent + Duration::days(21);

    // If dec 8 is sunday & in advent time
    if dec_8 >= first_advent && dec_8 <= fourth_advent && dec_8.weekday() == Weekday::Sun {
        dec_8 + Duration::days(1)
    } else {
        dec_8
    }
}

// Traditionnal
/// Septuagesima Sunday is the ninth Sunday before Easter.
pub fn septuagesima_sunday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), -63)
}
/// Passion Sunday is the second Sunday before Easter.
pub fn passion_sunday(year: i32, config: LiturgicalConfig) -> NaiveDate {
    offset(easter_sunday(year, config), -14)
}
/// Returns the Sunday between the Christmas Octave and Epiphany.
/// Used by the traditional Roman Calendar (1960 rubrics / 1962 Missal)
/// for the feast of the Most Holy Name of Jesus.
///
/// If there is no Sunday between December 26 and January 5,
/// January 2 is used.
pub fn sunday_between_christmas_octave_and_epiphany(year: i32) -> NaiveDate {
    let mut date = NaiveDate::from_ymd_opt(year, 12, 26).unwrap();

    let end = NaiveDate::from_ymd_opt(year + 1, 1, 5).unwrap();

    while date <= end {
        if date.weekday() == Weekday::Sun {
            return date;
        }

        date += Duration::days(1);
    }

    NaiveDate::from_ymd_opt(year + 1, 1, 2).unwrap()
}

// We now use calculator for week number so we can use it in feria
/// Returns the liturgical week number within the current season
/// for the Roman General Calendar (1969+).
///
/// This function returns the week number for any day of the week,
/// making it suitable for both Sundays ("3rd Sunday of Lent")
/// and weekdays ("Tuesday of the 3rd Week of Lent").
///
/// Returns `None` during Christmas Time, whose weekdays and Sundays
/// have their own proper celebrations.
///
/// Coverage:
/// - Advent:        Weeks 1–4
/// - Lent:          Weeks 1–6 (Week 6 includes Palm Sunday)
/// - Eastertide:    Weeks 1–7 (Pentecost excluded)
/// - Ordinary Time: Weeks 2–34
pub fn week_number_roman_general(
    date: NaiveDate,
    year: i32,
    config: LiturgicalConfig,
) -> Option<u32> {
    let easter = easter_sunday(year, config);
    let advent = first_advent_sunday(year);

    // Ash Wednesday = Easter - 46; first Sunday of Lent = Easter - 42.
    let first_lent = offset(easter, -42);

    // Christ the King = 34th Sunday of Ordinary Time.
    let christ_king = christ_the_king(year, config);

    // ── ADVENT ────────────────────────────────────────────────────────────────
    if date >= advent {
        let week = ((date - advent).num_days() / 7) as u32 + 1;

        if week <= 4 {
            return Some(week);
        }
    }

    // ── LENT ──────────────────────────────────────────────────────────────────
    if date >= first_lent && date < easter {
        let week = ((date - first_lent).num_days() / 7) as u32 + 1;
        return Some(week);
    }

    // ── EASTERTIDE ────────────────────────────────────────────────────────────
    // Easter Sunday = Week 1.
    // The Seventh Week of Easter runs until the Saturday before Pentecost.
    // Pentecost itself is a proper solemnity and is excluded.
    if date >= easter && date < pentecost(year, config) {
        let week = ((date - easter).num_days() / 7) as u32 + 1;
        return Some(week);
    }

    // ── ORDINARY TIME (Part I) ────────────────────────────────────────────────
    // From the day after the Baptism of the Lord until the day before
    // Ash Wednesday.
    //
    // The weekdays immediately following the Baptism belong to Week 1,
    // while the first Sunday of Ordinary Time is Week 2.
    //
    // We determine the liturgical week by normalizing each date to
    // the Sunday that starts that liturgical week.
    let baptism = baptism_of_the_lord(year, config);
    let first_ot1_start_day = baptism + Duration::days(1);
    let last_ot1 = offset(first_lent, -1);

    if date >= first_ot1_start_day && date <= last_ot1 {
        // Sunday starting the first liturgical week of Ordinary Time.
        let start_sunday = first_ot1_start_day
            - Duration::days(first_ot1_start_day.weekday().num_days_from_sunday() as i64);

        // Normalize current date to the Sunday starting its liturgical week.
        let sunday = date - Duration::days(date.weekday().num_days_from_sunday() as i64);

        let weeks_from_start = ((sunday - start_sunday).num_days() / 7) as u32;

        return Some(1 + weeks_from_start);
    }

    // ── ORDINARY TIME (Part II) ───────────────────────────────────────────────
    // From Trinity Sunday until Christ the King.
    //
    // Count backwards from Christ the King, which is the 34th Sunday
    // of Ordinary Time.
    //
    // Normalize to the Sunday starting the liturgical week so weekdays
    // keep the same week number.
    let first_ot2 = trinity_sunday(year, config);

    let sunday_of_week = date - Duration::days(date.weekday().num_days_from_sunday() as i64);

    if sunday_of_week >= first_ot2 && sunday_of_week <= christ_king {
        let weeks_before_end = ((christ_king - sunday_of_week).num_days() / 7) as u32;

        return Some(34 - weeks_before_end);
    }

    // Christmas Time has proper weekdays and Sundays.
    None
}

/// Returns the liturgical week number within the traditional Roman Calendar
/// (1960 rubrics / 1962 Missal).
///
/// The numbering follows the traditional seasonal structure:
///
/// - Advent: Weeks 1–4
/// - Septuagesima: Weeks 1–3
/// - Lent: Weeks 1–4
/// - Passiontide: Weeks 1–2
/// - Eastertide: Weeks 1–7
/// - Time after Pentecost: numbered by Sundays after Pentecost
///
/// Trinity Sunday is a proper Sunday/feast, but does not reset the
/// "Sundays after Pentecost" numbering: it is the first Sunday after Pentecost.
///
/// Christmas Time and the Triduum are not numbered here.
pub fn week_number_roman_1960(date: NaiveDate, year: i32, config: LiturgicalConfig) -> Option<u32> {
    let easter = easter_sunday(year, config);
    let advent = first_advent_sunday(year);

    let septuagesima = septuagesima_sunday(year, config);
    let ash_wednesday = ash_wednesday(year, config);
    let passion_sunday = passion_sunday(year, config);
    let holy_thursday = holy_thursday(year, config);
    let pentecost = pentecost(year, config);

    // ─────────────────────────────────────────────────────────────────────────
    // ADVENT
    // ─────────────────────────────────────────────────────────────────────────
    //
    // First Sunday of Advent = Week 1.
    if date >= advent {
        let week = ((date - advent).num_days() / 7) as u32 + 1;

        if week <= 4 {
            return Some(week);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // SEPTUAGESIMA
    // ─────────────────────────────────────────────────────────────────────────
    //
    // Septuagesima  = Week 1
    // Sexagesima    = Week 2
    // Quinquagesima = Week 3
    //
    // This period ends with Shrove Tuesday.
    if date >= septuagesima && date < ash_wednesday {
        let week = ((date - septuagesima).num_days() / 7) as u32 + 1;

        return Some(week);
    }

    // ─────────────────────────────────────────────────────────────────────────
    // LENT
    // ─────────────────────────────────────────────────────────────────────────
    //
    // First Sunday of Lent = Week 1.
    //
    // Ash Wednesday belongs to the first week of Lent.
    // Therefore we normalize dates to the Sunday starting their liturgical week.
    let first_lent = offset(easter, -42);

    if date >= ash_wednesday && date < passion_sunday {
        let sunday = date - Duration::days(date.weekday().num_days_from_sunday() as i64);

        let week = ((sunday - first_lent).num_days() / 7) as u32 + 1;

        if week <= 4 {
            return Some(week);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // PASSIONTIDE
    // ─────────────────────────────────────────────────────────────────────────
    //
    // Passion Sunday = Week 1 of Passiontide.
    //
    // Passiontide begins on Passion Sunday and ends before Holy Thursday.
    if date >= passion_sunday && date < holy_thursday {
        let sunday = date - Duration::days(date.weekday().num_days_from_sunday() as i64);

        let week = ((sunday - passion_sunday).num_days() / 7) as u32 + 1;

        if week <= 2 {
            return Some(week);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // EASTERTIDE
    // ─────────────────────────────────────────────────────────────────────────
    //
    // Easter Sunday = Week 1.
    // The seven weeks of Eastertide run until the Saturday before Pentecost.
    //
    // Pentecost itself is a proper solemnity and is excluded.
    if date >= easter && date < pentecost {
        let week = ((date - easter).num_days() / 7) as u32 + 1;

        if week <= 7 {
            return Some(week);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // TIME AFTER PENTECOST
    // ─────────────────────────────────────────────────────────────────────────
    //
    // Trinity Sunday is the first Sunday after Pentecost.
    //
    // However, the traditional numbering is:
    //
    //   Trinity Sunday     = 1st Sunday after Pentecost
    //   following Sunday   = 2nd Sunday after Pentecost
    //   etc.
    //
    // Weekdays are assigned to the Sunday beginning their liturgical week.
    let first_sunday_after_pentecost = pentecost + Duration::days(7);

    let sunday_of_week = date - Duration::days(date.weekday().num_days_from_sunday() as i64);

    if sunday_of_week >= first_sunday_after_pentecost && sunday_of_week < advent {
        let weeks_from_start =
            ((sunday_of_week - first_sunday_after_pentecost).num_days() / 7) as u32;

        return Some(1 + weeks_from_start);
    }

    // Christmas Time and the Triduum have proper celebrations.
    None
}

// ─────────────────────────────────────────────────────────────────────────────
// PUBLIC DISPATCHER
// ─────────────────────────────────────────────────────────────────────────────

/// Returns the liturgical week number according to the configured
/// liturgical calendar.
///
/// The calculation differs between the Roman General Calendar (1969+)
/// and the traditional Roman Calendar (1960 rubrics / 1962 Missal).
// pub fn week_number_in_season(date: NaiveDate, year: i32, config: LiturgicalConfig) -> Option<u32> {
//     match config.liturgical_system {
//         LiturgicalSystem::RomanGeneral => week_number_roman_general(date, year, config),
//         LiturgicalSystem::Roman1960 => week_number_roman_1960(date, year, config),
//     }
// }

/// Resolves a movable date from its base and day offset.
///
/// For all base movable dates listed above
pub fn resolve_movable_date(
    year: i32,
    base: MovableBase,
    offset_days: i16,
    config: LiturgicalConfig,
) -> NaiveDate {
    match base {
        MovableBase::EasterSunday => offset(easter_sunday(year, config), offset_days),
        MovableBase::FirstAdventSunday => offset(first_advent_sunday(year), offset_days),
        MovableBase::SundayAfterEpiphany => {
            offset(sunday_after_epiphany(year, config), offset_days)
        }
        MovableBase::SundayWithinChristmasOctaveOrDec30 => {
            offset(sunday_within_christmas_octave_or_dec30(year), offset_days)
        }
        MovableBase::PalmSunday => offset(palm_sunday(year, config), offset_days),
        MovableBase::DivineMercySunday => offset(divine_mercy_sunday(year, config), offset_days),
        MovableBase::Pentecost => offset(pentecost(year, config), offset_days),
        MovableBase::TrinitySunday => offset(trinity_sunday(year, config), offset_days),
        MovableBase::SecondSundayAfterPentecost => {
            offset(second_sunday_after_pentecost(year, config), offset_days)
        }
        MovableBase::BaptismOfTheLord => offset(baptism_of_the_lord(year, config), offset_days),
        MovableBase::AshWednesday => offset(ash_wednesday(year, config), offset_days),
        MovableBase::HolyThursday => offset(holy_thursday(year, config), offset_days),
        MovableBase::AscensionSunday => offset(ascension_sunday(year, config), offset_days),
        MovableBase::Epiphany => offset(epiphany(year, config), offset_days),
        MovableBase::SaintJoseph => offset(saint_joseph(year, config), offset_days),
        MovableBase::Annunciation => offset(annunciation(year, config), offset_days),
        MovableBase::ImmaculateConception => offset(immaculate_conception(year), offset_days),
        MovableBase::SeptuagesimaSunday => offset(septuagesima_sunday(year, config), offset_days),
        MovableBase::PassionSunday => offset(passion_sunday(year, config), offset_days),
        MovableBase::SundayBetweenChristmasOctaveAndEpiphany => offset(
            sunday_between_christmas_octave_and_epiphany(year),
            offset_days,
        ),
        MovableBase::ChristTheKing => offset(christ_the_king(year, config), offset_days),
    }
}
