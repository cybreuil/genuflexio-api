#!/usr/bin/env bash
set -euo pipefail

# Usage:
# ./scripts/convert_images_native.sh --src public/saints-pic --out public/saints-pic-webp
# Options:
# --src=PATH       (required)
# --out=PATH       (required)
# --sizes=1600,1024,640,320
# --quality=95     (quality for webp master; smaller variants get smaller quality automatically)
# --min-kb=0       (skip files <= this KB)
# --dry=true       (dry run default)
# IMPORTANT TURN FORCE TRUE FOR ALL CONVERSION
# --force=false    (force writing even if webp larger than original)
# Example real run:
# ./scripts/convert_images_native.sh --src public/saints-pic --out public/saints-pic-webp --dry=false --force=true

# Parse args (simple)
for arg in "$@"; do
  case "$arg" in
    --src=*) SRC="${arg#*=}" ;;
    --out=*) OUT="${arg#*=}" ;;
    --sizes=*) SIZES="${arg#*=}" ;;
    --quality=*) QUALITY="${arg#*=}" ;;
    --min-kb=*) MINKB="${arg#*=}" ;;
    --dry=*) DRY="${arg#*=}" ;;
    --force=*) FORCE="${arg#*=}" ;;
    *) echo "Unknown arg: $arg"; exit 1 ;;
  esac
done


: "${SRC:?--src is required}"
: "${OUT:?--out is required}"
SIZES="${SIZES:-1600,1024,640,320}"
QUALITY="${QUALITY:-95}"
MINKB="${MINKB:-0}"
DRY="${DRY:-true}"
FORCE="${FORCE:-false}"

# tools
# Commented out vipsthumbnail check because it was causing issues on some systems. You can uncomment it if you want to prioritize libvips over ImageMagick.
# if command -v vipsthumbnail >/dev/null 2>&1; then
#   TOOL="vips"
#   echo "Using libvips (vipsthumbnail)"
# should be elif here line 46
if command -v magick >/dev/null 2>&1; then
  TOOL="magick"
  echo "vipsthumbnail not found, using ImageMagick (magick)"
elif command -v convert >/dev/null 2>&1; then
  TOOL="magick"
  echo "Using ImageMagick (convert)"
else
  echo "Neither vipsthumbnail nor magick found. Install libvips or ImageMagick (pacman -S vips or pacman -S imagemagick)."
  exit 2
fi

IFS=',' read -ra SIZE_ARR <<< "$SIZES"

# create out base
mkdir -p "$OUT"

REPORT="conversion_report.csv"
echo "input,orig_kb,size,quality,out_kb,wrote,note" > "$REPORT"

shopt -s globstar nullglob
EXTS=(jpg jpeg png tiff bmp webp JPG JPEG PNG TIFF BMP gif GIF)
for ext in "${EXTS[@]}"; do
  for srcfile in "$SRC"/**/*."$ext"; do
    # guard
    [ -f "$srcfile" ] || continue
    rel="${srcfile#$SRC/}"
    orig_bytes=$(stat -c%s "$srcfile")
    orig_kb=$((orig_bytes/1024))
    if [ "$MINKB" -ne 0 ] && [ "$orig_kb" -le "$MINKB" ]; then
      echo "SKIP small <=${MINKB}KB: $rel ($orig_kb KB)"
      continue
    fi

    for idx in "${!SIZE_ARR[@]}"; do
      size=${SIZE_ARR[$idx]}
      # quality heuristic
      if [ "$idx" -eq 0 ]; then
        q="$QUALITY"
      else
        # decrease quality for smaller sizes (simple heuristic)
        q=$(( QUALITY - (idx * 10) ))
        if [ "$q" -lt 40 ]; then q=40; fi
      fi

      # out path
      base="${rel%.*}"
      if [ "$idx" -eq 0 ]; then
        out_rel="${base}.webp"
      else
        out_rel="${base}-${size}.webp"
      fi
      outpath="$OUT/$out_rel"
      outdir=$(dirname "$outpath")
      mkdir -p "$outdir"

      # create temporary output in /tmp
      tmpout=$(mktemp --suffix=.webp)

      if [ "$TOOL" = "vips" ]; then
        out_with_q="${tmpout}[Q=${q}]"

        if ! vipsthumbnail "$srcfile" \
            --size "$size" \
            --output "$out_with_q"; then
          echo "ERROR: vipsthumbnail failed for $rel size $size" >&2
          rm -f "$tmpout"
          continue
        fi
      fi


      if [ "$TOOL" = "magick" ]; then
        # ImageMagick: resize and convert. no upscaling due to '>' in geometry.
        # -resize '${size}x${size}>' keeps aspect ratio and prevents upscaling
        if command -v magick >/dev/null 2>&1; then
          magick "$srcfile" -resize "${size}x${size}>" -quality "$q" "$tmpout" >/dev/null 2>&1
        else
          # old convert
          convert "$srcfile" -resize "${size}x${size}>" -quality "$q" "$tmpout" >/dev/null 2>&1
        fi
      fi

      # ensure tmpout exists
      if [ ! -f "$tmpout" ]; then
        echo "ERROR: temporary output not created for $rel size $size"
        echo "$rel,$orig_kb,$size,$q, ,no,error_tmp" >> "$REPORT"
        rm -f "$tmpout" || true
        continue
      fi

      out_bytes=$(stat -c%s "$tmpout")
      out_kb=$((out_bytes/1024))

      wrote="no"
      note=""
      if [ "$FORCE" = "true" ] || [ "$out_kb" -lt "$orig_kb" ]; then
        if [ "$DRY" = "true" ]; then
          echo "DRY WRITE $out_rel : orig ${orig_kb}KB -> out ${out_kb}KB q=${q} size=${size}"
        else
          mv -f "$tmpout" "$outpath"
          echo "WROTE $out_rel : orig ${orig_kb}KB -> out ${out_kb}KB q=${q} size=${size}"
        fi
        wrote="yes"
      else
        note="skipped_bigger_than_original"
        echo "SKIP $out_rel : orig ${orig_kb}KB <= out ${out_kb}KB q=${q} size=${size}"
        rm -f "$tmpout"
      fi

      # append report
      echo "\"$rel\",$orig_kb,$size,$q,$out_kb,$wrote,$note" >> "$REPORT"

    done # sizes
  done # files for ext
done # exts

echo "Done. See $REPORT. Dry=${DRY} Force=${FORCE}"
