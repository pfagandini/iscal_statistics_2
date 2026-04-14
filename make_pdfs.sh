#!/usr/bin/env bash
# Generate PDFs from compiled RevealJS slides using decktape.
# Run this from the project root after `quarto render`.

SLIDES_DIR="docs/slides"
PDF_DIR="docs/PDF"

mkdir -p "$PDF_DIR"

for html in "$SLIDES_DIR"/*.html; do
  filename=$(basename "$html" .html)
  echo "Converting: $filename"
  npx decktape reveal \
    --size 1280x720 \
    --pause 2000 \
    --chrome-arg=--allow-file-access-from-files \
    "file://$(realpath "$html")" \
    "$PDF_DIR/$filename.pdf"
done

echo "Done. PDFs are in $PDF_DIR/"
