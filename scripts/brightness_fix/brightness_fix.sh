#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <BASE_DIR>"
    exit 1
fi

BASE_DIR=$1
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

MODULE_ZIP="${SCRIPT_DIR}/Camellia Brightness Fix V2 Beta.zip"
TARGET_PATH="${BASE_DIR}/vendor_a/bin/hw/android.hardware.lights-service.mediatek"
BINARY_IN_ZIP="system/vendor/bin/hw/android.hardware.lights-service.mediatek"

if [ ! -f "$MODULE_ZIP" ]; then
    echo "[❌] Brightness fix module not found: $MODULE_ZIP"
    exit 1
fi

if [ ! -f "$TARGET_PATH" ]; then
    echo "[❌] Original lights HAL binary not found: $TARGET_PATH"
    exit 1
fi

echo "[⚙️] Applying Camellia Brightness Fix..."

TMP_BIN=$(mktemp)
if ! unzip -p "$MODULE_ZIP" "$BINARY_IN_ZIP" > "$TMP_BIN" 2>/dev/null; then
    echo "[❌] Failed to extract binary from module zip"
    rm -f "$TMP_BIN"
    exit 1
fi

if [ ! -s "$TMP_BIN" ]; then
    echo "[❌] Extracted binary is empty"
    rm -f "$TMP_BIN"
    exit 1
fi

if ! sudo cp "$TMP_BIN" "$TARGET_PATH"; then
    echo "[❌] Failed to copy binary — no space left on vendor partition"
    rm -f "$TMP_BIN"
    exit 1
fi

sudo chown root:2000 "$TARGET_PATH"
sudo chmod 0755 "$TARGET_PATH"
sudo chcon "u:object_r:mtk_hal_light_exec:s0" "$TARGET_PATH"

rm -f "$TMP_BIN"

echo "[+] android.hardware.lights-service.mediatek replaced (brightness fix applied)"
echo "    owner:   root:2000"
echo "    perms:   0755"
echo "    context: u:object_r:mtk_hal_light_exec:s0"