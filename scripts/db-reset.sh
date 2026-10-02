#!/usr/bin/env bash
# Use bash to run this script

set -euo pipefail
# -e: exit on error
# -u: treat unset variables as an error
# -o pipefail: fail if any command in a pipeline fails

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# Compute the absolute path of the project root:
# 1) take the script's directory
# 2) go one level up
# 3) print the absolute path

# Auto-load .env if it exists
if [[ -f "$ROOT_DIR/.env" ]]; then
  set -a
  # -a: export all sourced variables automatically
  source "$ROOT_DIR/.env"
  set +a
fi

# Ensure DATABASE_URL is set
if [[ -z "${DATABASE_URL:-}" ]]; then
  echo "ERROR: DATABASE_URL is not set (in .env or exported)"
  exit 1
fi

run_sql() {
  local sql_file="$1"
  echo "Running: $sql_file"
  psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -f "$sql_file"
}

# 1) Create tables
run_sql "$ROOT_DIR/data/createTables.sql"
echo "✅ Tables dropped and created."

# 2) Seeds (order matters)

# Places
run_sql "$ROOT_DIR/data/seeds/seedPlaces.sql"
echo "✅ Places seeded."

# Seasons
run_sql "$ROOT_DIR/data/seeds/seedSeasons.sql"
echo "✅ Seasons seeded."

#Roman Logic
run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanSaints.sql"
echo "✅ Roman saints seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanSaintBiographies.sql"
echo "✅ Roman saint biographies seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanImages.sql"
echo "✅ Roman images seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanSaintImages.sql"
echo "✅ Roman saint images seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRoman.sql"
echo "✅ ROMAN seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanFeastDescription.sql"
echo "✅ ROMAN feast descriptions seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanSeasons.sql"
echo "✅ Roman seasons seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanSaintAttributes.sql"
echo "✅ ROMAN saint attributes seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanSaintPatronages.sql"
echo "✅ ROMAN saint patronages seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_General/seedRomanFeastSaints.sql"
echo "✅ ROMAN Feast Saints links seeded."

# France Calendar seeding
run_sql "$ROOT_DIR/data/seeds/Roman_France/seedRomanFrance.sql"
echo "✅ Roman France seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_France/seedRomanFranceFeastDescription.sql"
echo "✅ Roman France feast descriptions seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_France/seedRomanFranceSaints.sql"
echo "✅ Roman France saints seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_France/seedRomanFranceFeastSaints.sql"
echo "✅ Roman France Feast Saints links seeded."

# run_sql "$ROOT_DIR/data/seeds/Roman_France/seedRomanFranceSaintAttributes.sql"
# echo "✅ Roman France saint attributes seeded."

# run_sql "$ROOT_DIR/data/seeds/Roman_France/seedRomanFranceSaintPatronages.sql"
# echo "✅ Roman France saint patronages seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_France/seedRomanFranceImages.sql"
echo "✅ Roman France images seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_France/seedRomanFranceSaintImages.sql"
echo "✅ Roman France saint images seeded."

# Traditionnal
run_sql "$ROOT_DIR/data/seeds/Roman_1960/seedRoman1960.sql"
echo "✅ Roman 1960 seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_1960/seedRoman1960Seasons.sql"
echo "✅ Roman 1960 seasons seeded."

# run_sql "$ROOT_DIR/data/seeds/Roman_1960/seedRoman1960Saints.sql"
# echo "✅ Roman 1960 saints seeded."


# Spain Calendar seeding
run_sql "$ROOT_DIR/data/seeds/Roman_Spain/seedRomanSpain.sql"
echo "✅ Roman Spain seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Spain/seedRomanSpainFeastDescription.sql"
echo "✅ Roman Spain feast descriptions seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Spain/seedRomanSpainSaints.sql"
echo "✅ Roman Spain saints seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Spain/seedRomanSpainFeastSaints.sql"
echo "✅ Roman Spain Feast Saints links seeded."

# Portugal Calendar seeding
run_sql "$ROOT_DIR/data/seeds/Roman_Portugal/seedRomanPortugal.sql"
echo "✅ Roman Portugal seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Portugal/seedRomanPortugalSaints.sql"
echo "✅ Roman Portugal saints seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Portugal/seedRomanPortugalFeastSaints.sql"
echo "✅ Roman Portugal Feast Saints links seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Portugal/seedRomanPortugalImages.sql"
echo "✅ Roman Portugal images seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Portugal/seedRomanPortugalSaintImages.sql"
echo "✅ Roman Portugal saint images seeded."

# Poland Calendar seeding (!! Need to be after Spain cause we seed a feast we need for Poland)
run_sql "$ROOT_DIR/data/seeds/Roman_Poland/seedRomanPoland.sql"
echo "✅ Roman Poland seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Poland/seedRomanPolandSaints.sql"
echo "✅ Roman Poland saints seeded."

run_sql "$ROOT_DIR/data/seeds/Roman_Poland/seedRomanPolandFeastSaints.sql"
echo "✅ Roman Poland Feast Saints links seeded."

echo "✅ DB seeded."
