# Database Schema and Seed Data

This directory contains the PostgreSQL schema for the `genuflexio` database.

## Files

### `createTables.sql`

Main schema file for the liturgical calendar database.

It contains:

- table drops in reverse dependency order
- table creation
- indexes
- minimal seed data for:
    - locales
    - calendars
    - calendar translations
    - liturgical ranks
    - liturgical rank translations
    - liturgical colors
    - liturgical color translations

## Main Concepts

The schema separates technical entities from translated content.

### Technical/reference tables

These tables store stable internal data used by the application:

- `locales`
- `calendars`
- `liturgical_ranks`
- `liturgical_colors`
- `attributes`
- `patronages`

### Translation tables

These tables store display text by language:

- `calendar_translations`
- `liturgical_rank_translations`
- `liturgical_color_translations`
- `saint_translations`
- `feast_translations`
- `attribute_translations`
- `patronage_translations`

### Core liturgical/domain tables

These tables model saints, feasts, and celebrations:

- `saints`
- `feasts`
- `feast_dates`
- `celebrations`
- `celebration_saints`
- `saint_attributes`
- `saint_patronages`

## Schema Overview

### `locales`

Available languages used by translation tables.

Fields:

- `code`: locale code such as `fr`, `en`, `la`
- `native_name`: language name in that language
- `english_name`: language name in English
- `is_active`: whether the locale is enabled

### `calendars`

Liturgical calendars, with optional hierarchical inheritance through `parent_id`.

Examples:

- `ROMAN_GENERAL_1969`
- `ROMAN_FRANCE`
- `TRIDENTINE_1962`
- `ORTHODOX_RUSSIAN`
- `ORTHODOX_GREEK`

Fields:

- `code`: stable technical identifier
- `parent_id`: optional parent calendar
- `date_system`: `gregorian` or `julian`
- `easter_computation`: `western` or `eastern`
- `is_active`
- `created_at`

### `calendar_translations`

Localized display names and descriptions for calendars.

Fields:

- `calendar_id`
- `locale_code`
- `name`
- `description`

### `liturgical_ranks`

Liturgical rank definitions per calendar.

Examples:

- modern Roman: `SOLEMNITY`, `FEAST`, `MEM_OBL`, `MEM_OPT`, `FERIA`
- traditional: `CLASS_I`, `CLASS_II`, `CLASS_III`, `CLASS_IV`

Fields:

- `calendar_id`
- `code`
- `precedence`

### `liturgical_rank_translations`

Localized labels for liturgical ranks.

Fields:

- `rank_id`
- `locale_code`
- `label`

### `liturgical_colors`

Technical list of liturgical colors.

Examples:

- `WHITE`
- `RED`
- `GREEN`
- `PURPLE`

Fields:

- `code`
- `hex_color`

### `liturgical_color_translations`

Localized labels for liturgical colors.

Fields:

- `color_id`
- `locale_code`
- `label`

### `saints`

Core saint entity.

Fields include:

- `slug`
- `default_name`
- partial life-date fields:
    - `birth_year`, `birth_month`, `birth_day`
    - `death_year`, `death_month`, `death_day`
- approximate flags:
    - `birth_is_approximate`
    - `death_is_approximate`
- `century`
- `short_description`
- `image_url`
- `created_at`

### `saint_translations`

Localized saint content.

Fields:

- `name`
- `short_description`
- `full_biography`
- `life_label`

`life_label` is useful for human-readable historical dating such as:

- `Vers le IVe siècle`
- `c. 270–303`

### `attributes`

Normalized saint attributes.

Examples:

- `LILY`
- `SWORD`
- `BOOK`

Fields:

- `code`
- `category`

### `attribute_translations`

Localized labels and descriptions for attributes.

### `saint_attributes`

Many-to-many relation between saints and attributes.

### `patronages`

Normalized patronage codes.

Examples:

- `WORKERS`
- `FRANCE`
- `STUDENTS`

### `patronage_translations`

Localized labels and descriptions for patronages.

### `saint_patronages`

Many-to-many relation between saints and patronages.

### `feasts`

Core feast entity.

Fields:

- `slug`
- `default_name`
- `feast_type`
- `created_at`

Examples of `feast_type`:

- `saint`
- `marial`
- `christologique`
- `dedicace`
- `autre`

### `feast_translations`

Localized feast names and descriptions.

### `feast_dates`

Calendar-specific dating rules for feasts.

Supports:

- fixed dates:
    - `month`
    - `day`
- movable dates:
    - `movable_base`
    - `movable_offset_days`

Also supports optional historical validity windows:

- `valid_from`
- `valid_to`

### `celebrations`

Concrete liturgical celebration of a feast in a given calendar.

Fields:

- `feast_id`
- `calendar_id`
- `rank_id`
- `color_id`
- `is_optional`
- `notes`

A unique constraint on `(feast_id, calendar_id)` ensures one active celebration definition per feast/calendar pair in the current model.

### `celebration_saints`

Many-to-many relation between celebrations and saints.

Useful when:

- one celebration concerns one saint
- one celebration concerns several saints or companions

Optional field:

- `role`

## Indexes

The schema includes indexes for common lookups:

- `calendars(parent_id)` for hierarchy traversal
- partial indexes on `feast_dates` for:
    - fixed-date lookup
    - movable-date lookup
- indexes on `celebrations` foreign keys
- indexes on translation tables by `locale_code`

## Seed Data

The included seed section currently provides minimal reference data for:

- locales:
    - `fr`
    - `en`
    - `la`

- calendars:
    - `ROMAN_GENERAL_1969`
    - `TRIDENTINE_1962`
    - `ROMAN_FRANCE`
    - `ROMAN_ITALY`
    - `ORTHODOX_RUSSIAN`
    - `ORTHODOX_GREEK`

- calendar translations in:
    - French
    - English
    - Latin

- liturgical ranks for:
    - Roman General 1969
    - Tridentine 1962

- liturgical rank translations in:
    - French
    - English
    - Latin

- liturgical colors and their translations in:
    - French
    - English
    - Latin

## Usage

### Create a database

```/dev/null/setup.sh#L1-1
createdb ordo
```

Load the schema
Run from the `data` directory, or provide the full path to the SQL file.

```/dev/null/setup.sh#L1-1
psql ordo < createTables.sql
```

## Example Verification Queries

### List calendars with French names

```/dev/null/queries.sql#L1-6
SELECT c.code, ct.name
FROM calendars c
JOIN calendar_translations ct
  ON ct.calendar_id = c.id
WHERE ct.locale_code = 'fr'
ORDER BY c.code;
```

### List liturgical ranks for the Roman General calendar

```/dev/null/queries.sql#L8-16
SELECT c.code AS calendar_code, r.code AS rank_code, t.label, r.precedence
FROM liturgical_ranks r
JOIN calendars c ON c.id = r.calendar_id
JOIN liturgical_rank_translations t ON t.rank_id = r.id
WHERE c.code = 'ROMAN_GENERAL_1969'
  AND t.locale_code = 'fr'
ORDER BY r.precedence;
```

### List liturgical colors in English

```/dev/null/queries.sql#L18-24
SELECT lc.code, lct.label, lc.hex_color
FROM liturgical_colors lc
JOIN liturgical_color_translations lct
  ON lct.color_id = lc.id
WHERE lct.locale_code = 'en'
ORDER BY lc.code;
```

## Notes

- The schema is designed for PostgreSQL.
- `created_at` fields use `TIMESTAMPTZ`.
- Translation content is separated from technical reference tables.
- Calendar inheritance is modeled through `calendars.parent_id`.
- Resolution of inherited calendar data is expected to be handled by the application layer.

## Next Possible Improvements

Depending on project needs, you may later add:

- stricter checks on date consistency in `saints`
- a controlled vocabulary for `feast_type`
- historical versioning for `celebrations`
- additional indexes based on real query patterns
