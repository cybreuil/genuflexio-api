# Genuflexio API – Rust

A professional, fully async RESTful API for Catholic saints, feasts, and liturgical calendars, built with **Rust + Actix-Web + PostgreSQL (sqlx)**.

---

## Features

- **Saints** – CRUD (by ID, by slug, paginated list with optional locale translation)
- **Feasts** – CRUD (by ID, by slug, by date `month/day`, filterable by type)
- **Calendars** – CRUD (active/inactive filter, with associated liturgical ranks, celebrations sub-resource)
- **Celebrations** – Read (filterable by calendar/feast, detailed view with enriched data)
- **Health check** – `GET /health` with live database ping
- JWT-protected write endpoints (`POST`, `PUT`, `DELETE`)
- CORS enabled
- Structured request logging (tracing)
- JSON error responses with consistent shape `{ "error": "..." }`

---

## Prerequisites

- Rust 1.75+ (`rustup`)
- PostgreSQL 14+
- A running PostgreSQL instance with the schema from `data/createTables.sql`

---

## Quick Start

```bash
# 1. Clone and enter the project
cd saints-api

# 2. Copy and edit environment variables
cp .env.example .env
# Edit .env: set DATABASE_URL, JWT_SECRET, API_PORT

# 3. Load the database schema
psql $DATABASE_URL < data/createTables.sql

# 4. Build and run
cargo run
```

---

## Environment Variables

| Variable       | Required | Default | Description                      |
| -------------- | -------- | ------- | -------------------------------- |
| `DATABASE_URL` | ✅       | –       | PostgreSQL connection string     |
| `JWT_SECRET`   | ✅       | –       | Secret key for JWT signing       |
| `API_PORT`     | ❌       | `8080`  | Port the HTTP server listens on  |
| `RUST_LOG`     | ❌       | –       | Log level (e.g. `info`, `debug`) |

---

## API Reference

### Health

| Method | Path      | Auth | Description           |
| ------ | --------- | ---- | --------------------- |
| GET    | `/health` | –    | Service + DB liveness |

### Saints `/saints`

| Method | Path                  | Auth | Description                         |
| ------ | --------------------- | ---- | ----------------------------------- |
| GET    | `/saints`             | –    | List (paginated, optional `locale`) |
| GET    | `/saints/{id}`        | –    | Get by ID (optional `locale`)       |
| GET    | `/saints/slug/{slug}` | –    | Get by slug                         |
| POST   | `/saints`             | JWT  | Create saint                        |
| PUT    | `/saints/{id}`        | JWT  | Update saint                        |
| DELETE | `/saints/{id}`        | JWT  | Delete saint                        |

### Feasts `/feasts`

| Method | Path                         | Auth | Description                       |
| ------ | ---------------------------- | ---- | --------------------------------- |
| GET    | `/feasts`                    | –    | List (paginated, `feast_type`)    |
| GET    | `/feasts/{id}`               | –    | Get by ID (optional `locale`)     |
| GET    | `/feasts/slug/{slug}`        | –    | Get by slug                       |
| GET    | `/feasts/date/{month}/{day}` | –    | Fixed-date feasts for a given day |
| POST   | `/feasts`                    | JWT  | Create feast                      |
| PUT    | `/feasts/{id}`               | JWT  | Update feast                      |
| DELETE | `/feasts/{id}`               | JWT  | Delete feast                      |

### Calendars `/calendars`

| Method | Path                           | Auth | Description                        |
| ------ | ------------------------------ | ---- | ---------------------------------- |
| GET    | `/calendars`                   | –    | List (optional `is_active` filter) |
| GET    | `/calendars/{id}`              | –    | Get with liturgical ranks          |
| GET    | `/calendars/{id}/celebrations` | –    | Celebrations for a calendar        |
| POST   | `/calendars`                   | JWT  | Create calendar                    |
| PUT    | `/calendars/{id}`              | JWT  | Update calendar                    |
| DELETE | `/calendars/{id}`              | JWT  | Delete calendar                    |

### Celebrations `/celebrations`

| Method | Path                 | Auth | Description                                |
| ------ | -------------------- | ---- | ------------------------------------------ |
| GET    | `/celebrations`      | –    | List (filter by `calendar_id`, `feast_id`) |
| GET    | `/celebrations/{id}` | –    | Detail with feast, calendar, rank, color   |

---

## JWT Authentication

Protected endpoints require a `Bearer` token in the `Authorization` header:

```
Authorization: Bearer <your-jwt-token>
```

Tokens must be signed with `JWT_SECRET` using the HS256 algorithm. Example payload:

```json
{ "sub": "admin", "role": "admin", "exp": 9999999999 }
```

---

## Project Structure

```
src/
├── main.rs              # Server bootstrap, middleware wiring
├── config.rs            # Environment-driven configuration
├── db.rs                # PostgreSQL connection pool (sqlx)
├── errors/mod.rs        # ApiError type with HTTP response mapping
├── middleware/
│   └── auth.rs          # JWT bearer token validation
├── models/
│   ├── saint.rs         # Saint, SaintTranslation, CRUD DTOs
│   ├── feast.rs         # Feast, FeastDate, CRUD DTOs
│   ├── calendar.rs      # Calendar, LiturgicalRank, LiturgicalColor
│   ├── celebration.rs   # Celebration, CelebrationDetail
│   └── locale.rs        # Locale
└── api/
    ├── health.rs        # GET /health
    ├── saints.rs        # Saints CRUD
    ├── feasts.rs        # Feasts CRUD + date search
    ├── calendars.rs     # Calendars CRUD + celebrations sub-resource
    └── celebrations.rs  # Celebrations read endpoints
data/
└── createTables.sql     # Full PostgreSQL schema + seed data
```
