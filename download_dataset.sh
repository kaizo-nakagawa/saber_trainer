#!/usr/bin/env bash
#
# download_dataset.sh
#
# Script ini akan mengunduh seluruh isi folder Google Drive
# dan menaruhnya di dalam folder new_dataset/ sebelum proses training.

set -e

# -------------------------------------------------------
# 1. Direktori target di dalam repository
TARGET_DIR="new_dataset"
mkdir -p "${TARGET_DIR}"
# -------------------------------------------------------

# -------------------------------------------------------
# 2. URL folder Google Drive (ganti dengan link folder Anda)
FOLDER_URL="https://drive.google.com/drive/folders/19LXyYiRoEY1Gmiaeu6EicCyB1FXYTXg9?usp=sharing"
# -------------------------------------------------------

# -------------------------------------------------------
# 3. Periksa apakah gdown sudah terpasang; jika belum, pasang
if ! command -v gdown &> /dev/null; then
    echo "[INFO] gdown belum terpasang, menginstal via pip..."
    pip install --quiet gdown
fi
# -------------------------------------------------------

# -------------------------------------------------------
# 4. Unduh seluruh isi folder Google Drive
#    Opsi --folder memberitahu gdown untuk mengambil isi folder.
echo "[INFO] Mengunduh folder Google Drive dari: ${FOLDER_URL}"
gdown --folder "${FOLDER_URL}" -O "${TARGET_DIR}"

echo "[INFO] Isi folder telah diunduh ke: ${TARGET_DIR}/"
# -------------------------------------------------------
