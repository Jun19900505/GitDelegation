#!/bin/bash

set -e

OLD_DIR="/tmp/revision_old"
DIFF_TEX="00_Document_diff.tex"
BUILD_DIR="diff_build"

echo "Preparing old version..."
rm -rf "$OLD_DIR"
mkdir -p "$OLD_DIR"
git archive master | tar -x -C "$OLD_DIR"

echo "Running latexdiff..."
latexdiff --flatten --no-del \
    "$OLD_DIR/00_Document.tex" \
    "00_Document.tex" \
    > "$DIFF_TEX"
sed -i '' 's/\\providecommand{\\DIFaddtex}\[1\]{{\\protect\\color{blue}\\uwave{#1}}}/\\providecommand{\\DIFaddtex}[1]{{\\protect\\color{blue}#1}}/' "$DIFF_TEX"

echo "Compiling diff PDF..."
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
latexmk -xelatex -outdir="$BUILD_DIR" "$DIFF_TEX"

echo ""
echo "Done:"
echo "$BUILD_DIR/00_Document_diff.pdf"