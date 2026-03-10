#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
BASE_DIR=$1

OVERLAY_DST="${BASE_DIR}/product_a/overlay/NavBarOverlay"

echo "[=] Installing NavBar overlay..."
sudo mkdir -p "$OVERLAY_DST"
sudo cp "${SCRIPT_DIR}/NavBarOverlay.apk" "${OVERLAY_DST}/NavBarOverlay.apk"
sudo chown -R 0:0 "$OVERLAY_DST"
sudo chmod 0755 "$OVERLAY_DST"
sudo chmod 0644 "${OVERLAY_DST}/NavBarOverlay.apk"
sudo setfattr -n security.selinux -v "u:object_r:system_file:s0" "${OVERLAY_DST}/NavBarOverlay.apk"
sudo setfattr -n security.selinux -v "u:object_r:system_file:s0" "$OVERLAY_DST"
echo "[i] NavBar overlay installed"