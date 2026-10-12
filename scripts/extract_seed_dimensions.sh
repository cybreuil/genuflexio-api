#!/usr/bin/env bash

set -uo pipefail

# Usage :
# ./extract_seed_dimensions.sh seedImages.sql public image_dimensions.sql

SEED_FILE="${1:-}"
IMAGE_DIR="${2:-}"
OUTPUT_SQL="${3:-image_dimensions.sql}"

if [[ -z "$SEED_FILE" || -z "$IMAGE_DIR" ]]; then
  echo "Usage: $0 <seed.sql> <dossier_images> [output.sql]"
  exit 1
fi

if [[ ! -f "$SEED_FILE" ]]; then
  echo "Erreur : seed introuvable : $SEED_FILE"
  exit 1
fi

if [[ ! -d "$IMAGE_DIR" ]]; then
  echo "Erreur : dossier d'images introuvable : $IMAGE_DIR"
  exit 1
fi

if ! command -v identify >/dev/null 2>&1; then
  echo "Erreur : ImageMagick absent. Installe-le avec : brew install imagemagick"
  exit 1
fi

count=0
missing=0
invalid=0

# Extrait les chemins /... présents dans les valeurs SQL.
# Suppose que image_url est le premier champ de chaque tuple,
# comme dans le seed fourni.
mapfile -t urls < <(
  grep -Eo "^[[:space:]]*\('[^']+'" "$SEED_FILE" |
  sed -E "s/^[[:space:]]*\('//; s/'$//" |
  sort -u
)

if [[ ${#urls[@]} -eq 0 ]]; then
  echo "Aucune URL d'image trouvée dans le seed."
  exit 1
fi

{
  echo "-- Dimensions extraites depuis le seed : $SEED_FILE"
  echo "-- Vérifier les chemins avant exécution."
  echo "BEGIN;"
  echo
} > "$OUTPUT_SQL"

for url in "${urls[@]}"; do
  # Transforme /saints/image.webp en <IMAGE_DIR>/saints/image.webp
  relative_path="${url#/}"
  file="$IMAGE_DIR/$relative_path"

  if [[ ! -f "$file" ]]; then
    echo "⚠️  Image introuvable : $url (cherché : $file)"
    ((missing+=1))
    continue
  fi

  dimensions="$(identify -ping -format '%w %h' "${file}[0]" 2>/dev/null)" || {
    echo "⚠️  Image illisible : $url"
    ((invalid+=1))
    continue
  }

  read -r width height <<< "$dimensions"

  if [[ ! "$width" =~ ^[0-9]+$ || ! "$height" =~ ^[0-9]+$ ]]; then
    echo "⚠️  Dimensions invalides : $url"
    ((invalid+=1))
    continue
  fi

  escaped_url="${url//\'/\'\'}"

  printf "UPDATE images SET width = %s, height = %s WHERE image_url = '%s';\n" \
    "$width" "$height" "$escaped_url" >> "$OUTPUT_SQL"

  printf "✓ %4sx%-4s %s\n" "$width" "$height" "$url"
  ((count+=1))
done

echo "COMMIT;" >> "$OUTPUT_SQL"

echo
echo "Terminé."
echo "Images traitées : $count"
echo "Images introuvables : $missing"
echo "Images illisibles : $invalid"
echo "SQL généré : $OUTPUT_SQL"
