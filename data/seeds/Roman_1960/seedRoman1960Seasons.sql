BEGIN;

-- =========================================================
-- ROMAN 1960 — LITURGICAL SEASONS
--
-- General Rubrics 1960, §§71–77
--
-- Main seasons:
--   ADVENT
--   CHRISTMASTIDE
--   THROUGHOUT_THE_YEAR
--   SEPTUAGESIMA
--   LENT
--   PASCHALTIDE
--
-- Subdivisions:
--   CHRISTMASTIDE:
--     CHRISTMAS
--     EPIPHANY
--
--   LENT:
--     LENT
--     PASSIONTIDE
--
--   PASCHALTIDE:
--     EASTERTIDE
--     ASCENSIONTIDE
--     PENTECOST_OCTAVE
--
--   THROUGHOUT_THE_YEAR:
--     PART I
--     PART II
--
-- =========================================================


-- =========================================================
-- 1. ADVENT
-- I Vespers of First Sunday of Advent
-- through None of Christmas Eve inclusive
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'ADVENT',
    0,
    'movable', NULL, NULL, 'FIRST_ADVENT_SUNDAY', 0,
    'fixed', 12, 24, NULL, 0,
    TRUE,
    'Advent — 1960 rubrics §71'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 2. CHRISTMASTIDE
-- December 25 – January 13
--
-- Subdivided into:
--   CHRISTMAS: December 25 – January 5
--   EPIPHANY: January 6 – January 13
--
-- §72
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'CHRISTMASTIDE',
    0,
    'fixed', 12, 25, NULL, 0,
    'fixed', 1, 13, NULL, 0,
    TRUE,
    'Christmastide — 1960 rubrics §72'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 2a. CHRISTMAS
-- December 25 – January 5
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'CHRISTMAS',
    0,
    'fixed', 12, 25, NULL, 0,
    'fixed', 1, 5, NULL, 0,
    TRUE,
    'Christmas — subdivision of Christmastide, 1960 rubrics §72a'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 2b. EPIPHANY
-- January 6 – January 13
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'EPIPHANY',
    0,
    'fixed', 1, 6, NULL, 0,
    'fixed', 1, 13, NULL, 0,
    TRUE,
    'Epiphany — subdivision of Christmastide, 1960 rubrics §72b'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 3. THROUGHOUT THE YEAR — PART I
-- January 14 – Saturday before Septuagesima
--
-- §77
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'AFTER_EPIPHANY',
    0,
    'fixed', 1, 14, NULL, 0,
    'movable', NULL, NULL, 'SEPTUAGESIMA_SUNDAY', -1,
    TRUE,
    'Throughout the Year — Part I — 1960 rubrics §77'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 4. SEPTUAGESIMA
-- Septuagesima Sunday – Tuesday of Quinquagesima week
--
-- §73
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'SEPTUAGESIMA',
    0,
    'movable', NULL, NULL, 'SEPTUAGESIMA_SUNDAY', 0,
    'movable', NULL, NULL, 'ASH_WEDNESDAY', -1,
    TRUE,
    'Septuagesima — 1960 rubrics §73'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 5. LENTEN SEASON
--
-- The 1960 rubrics define the Lenten Season (§74)
-- as Ash Wednesday through the Easter Vigil exclusive.
--
-- It contains:
--   LENT
--   PASSIONTIDE
--
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'LENT',
    0,
    'movable', NULL, NULL, 'ASH_WEDNESDAY', 0,
    'movable', NULL, NULL, 'EASTER_SUNDAY', -1,
    TRUE,
    'Lenten Season — Ash Wednesday through Holy Saturday — 1960 rubrics §74'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 5a. LENT PROPER
-- Ash Wednesday – Saturday before First Sunday of Passion
--
-- §74a
-- =========================================================

-- INSERT INTO liturgical_season_intervals (
--     calendar_id,
--     season_code,
--     segment_index,
--     start_kind,
--     start_month,
--     start_day,
--     start_movable_base,
--     start_offset_days,
--     end_kind,
--     end_month,
--     end_day,
--     end_movable_base,
--     end_offset_days,
--     inclusive,
--     notes
-- )
-- SELECT
--     c.id,
--     'LENT',
--     1,
--     'movable', NULL, NULL, 'ASH_WEDNESDAY', 0,
--     'movable', NULL, NULL, 'PASSION_SUNDAY', -1,
--     TRUE,
--     'Lent proper — 1960 rubrics §74a'
-- FROM calendars c
-- WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 5b. PASSIONTIDE
-- First Sunday of Passion – Easter Vigil exclusive
--
-- §74b
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'PASSIONTIDE',
    0,
    'movable', NULL, NULL, 'PASSION_SUNDAY', 0,
    'movable', NULL, NULL, 'EASTER_SUNDAY', -1,
    TRUE,
    'Passiontide — 1960 rubrics §74b'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 6. HOLY WEEK
-- Palm Sunday – Holy Saturday
--
-- §75
--
-- This is NOT a separate season.
-- It is a subdivision of Passiontide.
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'HOLY_WEEK',
    0,
    'movable', NULL, NULL, 'PALM_SUNDAY', 0,
    'movable', NULL, NULL, 'EASTER_SUNDAY', -1,
    TRUE,
    'Holy Week — Palm Sunday through Holy Saturday — 1960 rubrics §75'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 6a. SACRED TRIDUUM
-- Holy Thursday – Holy Saturday
--
-- §75
--
-- Not a separate season.
-- Subdivision of Holy Week.
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'TRIDUUM',
    0,
    'movable', NULL, NULL, 'HOLY_THURSDAY', 0,
    'movable', NULL, NULL, 'EASTER_SUNDAY', -1,
    TRUE,
    'Sacred Triduum — 1960 rubrics §75'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 7. PASCHALTIDE
-- Easter Vigil – Saturday within Pentecost Octave
--
-- §76
--
-- Subdivided into:
--   EASTERTIDE
--   ASCENSIONTIDE
--   PENTECOST_OCTAVE
--
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'PASCHALTIDE',
    0,
    'movable', NULL, NULL, 'EASTER_SUNDAY', 0,
    'movable', NULL, NULL, 'PENTECOST', 6,
    TRUE,
    'Paschaltide — Easter Vigil through Saturday within Pentecost Octave — 1960 rubrics §76'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 7a. EASTERTIDE
-- Easter Vigil – Vigil of Ascension
--
-- §76a
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'EASTERTIDE',
    0,
    'movable', NULL, NULL, 'EASTER_SUNDAY', 0,
    'movable', NULL, NULL, 'ASCENSION_SUNDAY', -1,
    TRUE,
    'Easter season — Easter Vigil through vigil of Ascension — 1960 rubrics §76a'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 7b. ASCENSIONTIDE
-- Ascension – Vigil of Pentecost
--
-- §76b
--
-- NOTE:
-- ASCENSION is the movable feast itself.
-- The actual liturgical season begins at I Vespers.
-- For date-level calendar purposes, using Ascension date
-- as the boundary is appropriate.
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'ASCENSIONTIDE',
    0,
    'movable', NULL, NULL, 'ASCENSION_SUNDAY', 0,
    'movable', NULL, NULL, 'PENTECOST', -1,
    TRUE,
    'Ascensiontide — 1960 rubrics §76b'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 7c. PENTECOST OCTAVE
-- Vigil of Pentecost – Saturday within Pentecost Octave
--
-- §76c
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'PENTECOST_OCTAVE',
    0,
    'movable', NULL, NULL, 'PENTECOST', 0,
    'movable', NULL, NULL, 'PENTECOST', 6,
    TRUE,
    'Octave of Pentecost — Vigil through Saturday — 1960 rubrics §76c'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- 8. THROUGHOUT THE YEAR — PART II
-- Trinity Sunday – Saturday before First Sunday of Advent
--
-- §77
-- =========================================================

INSERT INTO liturgical_season_intervals (
    calendar_id,
    season_code,
    segment_index,
    start_kind,
    start_month,
    start_day,
    start_movable_base,
    start_offset_days,
    end_kind,
    end_month,
    end_day,
    end_movable_base,
    end_offset_days,
    inclusive,
    notes
)
SELECT
    c.id,
    'AFTER_PENTECOST',
    0,
    'movable', NULL, NULL, 'TRINITY_SUNDAY', 0,
    'movable', NULL, NULL, 'FIRST_ADVENT_SUNDAY', -1,
    TRUE,
    'Throughout the Year — Part II — 1960 rubrics §77'
FROM calendars c
WHERE c.code = 'ROMAN_1960';


-- =========================================================
-- COLORS
-- =========================================================
--
-- Colors are assigned to actual seasons/subseasons.
-- Holy Week / Triduum are handled separately by feast/day
-- rubrics and should not be inferred solely from season color.
--
-- =========================================================

INSERT INTO liturgical_season_colors (
    season_code,
    calendar_id,
    color_id
)
SELECT
    x.season_code,
    c.id,
    lc.id
FROM calendars c
JOIN (
    VALUES
        ('ADVENT',              'PURPLE'),
        ('CHRISTMASTIDE',       'WHITE'),
        ('CHRISTMAS',           'WHITE'),
        ('EPIPHANY',             'WHITE'),
        ('AFTER_EPIPHANY', 		'GREEN'),
        ('SEPTUAGESIMA',        'PURPLE'),
        ('LENT',                'PURPLE'),
        ('PASSIONTIDE',         'PURPLE'),
        ('HOLY_WEEK',            'PURPLE'),
        ('TRIDUUM',              'RED'),
        ('PASCHALTIDE',         'WHITE'),
        ('EASTERTIDE',           'WHITE'),
        ('ASCENSIONTIDE',        'WHITE'),
        ('PENTECOST_OCTAVE',     'RED'),
        ('AFTER_PENTECOST',      'GREEN')
) AS x(season_code, color_code)
    ON c.code = 'ROMAN_1960'
JOIN liturgical_colors lc
    ON lc.code = x.color_code
ON CONFLICT (season_code, calendar_id)
DO UPDATE SET color_id = EXCLUDED.color_id;


COMMIT;
