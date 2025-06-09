#!/usr/bin/env bash
set -e

# Direktori destiasi dataset
RAW_DIR="raw"
mkdir -p "$RAW_DIR"

# ID file ZIP di Google Drive (lihat link share: uc?export=download&id=FILE_ID)
FILE_ID="1pGQGchoCSGdYIMXJ5k9EXjCf7cvQOU2d"
ZIP_NAME="dataset_latest.zip"

# Pastikan gdown terinstall
if ! command -v gdown &>/dev/null; then
  pip install --quiet gdown
fi

echo "[INFO] Downloading dataset from Drive…"
gdown --id "$FILE_ID" -O "$RAW_DIR/$ZIP_NAME"

echo "[INFO] Unzipping…"
unzip -q "$RAW_DIR/$ZIP_NAME" -d "$RAW_DIR"

echo "[INFO] Cleaning up…"
rm "$RAW_DIR/$ZIP_NAME"

echo "[INFO] Dataset ready at $RAW_DIR/"
