#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1
SCRIPT_DIR="scripts/microg"
FILES_DIR="${SCRIPT_DIR}/files"

SYSTEM_DIR="${MOUNT_DIR}/system_a/system"
PRODUCT_DIR="${MOUNT_DIR}/product_a"
SYSTEM_EXT_DIR="${MOUNT_DIR}/system_ext_a"

# ── Helpers ───────────────────────────────────────────────────────────────────

# Apply permissions recursively to a directory:
# dirs → 0755, files → 0644, selinux → system_file
set_permissions_recursive() {
    local target=$1
    sudo chown -R 0:0 "$target"
    sudo find "$target" -type d -exec sudo chmod 0755 {} \;
    sudo find "$target" -type f -exec sudo chmod 0644 {} \;
    sudo find "$target" -exec sudo setfattr -n security.selinux \
        -v "u:object_r:system_file:s0" {} \; 2>/dev/null
}

set_file_permissions() {
    sudo chown 0:0 "$1"
    sudo chmod 0644 "$1"
    sudo setfattr -n security.selinux -v "u:object_r:system_file:s0" "$1"
}

# Copy a config file and set permissions
# Usage: copy_config <src> <dest>
copy_config() {
    local src=$1
    local dest=$2
    local name
    name=$(basename "$src")

    if [ ! -f "$src" ]; then
        echo "[❌] Config file not found: ${src}"
        return 1
    fi

    sudo cp "$src" "$dest" || { echo "[❌] Failed to copy ${name}"; return 1; }
    set_file_permissions "$dest"
    echo "[+] Config installed: ${name}"
}

# Install an app folder into a partition subfolder.
# Copies the ENTIRE source folder (APK + any subfolders like lib/).
# Usage: install_apk <partition> <subfolder> <app_name>
# Example: install_apk "product_a" "priv-app" "GmsCore"
install_apk() {
    local partition=$1
    local subfolder=$2
    local app_name=$3
    local src_dir="${FILES_DIR}/${app_name}"
    local dest_dir="${MOUNT_DIR}/${partition}/${subfolder}/${app_name}"

    if [ ! -d "$src_dir" ]; then
        echo "[❌] Source folder not found: ${src_dir}"
        return 1
    fi

    if [ ! -f "${src_dir}/${app_name}.apk" ]; then
        echo "[❌] APK not found: ${src_dir}/${app_name}.apk"
        return 1
    fi

    echo "[🔵] Installing ${app_name} → /${partition}/${subfolder}/"

    # Remove any existing installation (case-insensitive to catch Phonesky/PhoneSky variants)
    sudo find "${MOUNT_DIR}/${partition}/${subfolder}" \
        -maxdepth 1 -iname "${app_name}" -type d \
        -exec sudo rm -rf {} \; 2>/dev/null

    # Copy the entire source folder recursively
    sudo cp -r "$src_dir" "${MOUNT_DIR}/${partition}/${subfolder}/" \
        || { echo "[❌] Failed to copy ${app_name}"; return 1; }

    # Apply correct permissions to everything inside
    set_permissions_recursive "$dest_dir"

    echo "[✅] ${app_name} installed"
}

# ── Remove stock GMS components that conflict with microG ────────────────────

echo ""
echo "── Removing conflicting stock GMS ───────────────────────────────────────"

# Use find -iname to handle any capitalization variant (Phonesky, PhoneSky, etc.)
for app in "GmsCore"; do # "Phonesky"
    sudo find "${PRODUCT_DIR}/priv-app" \
        -maxdepth 1 -iname "${app}" -type d \
        -exec sudo rm -rf {} \; 2>/dev/null
    echo "[-] Removed stock (if present): ${app}"
done

# ── Install microG APKs ───────────────────────────────────────────────────────

echo ""
echo "── Installing microG ────────────────────────────────────────────────────"

install_apk "product_a"    "priv-app" "GmsCore"
# install_apk "product_a"    "priv-app" "PhoneSky"
install_apk "system_ext_a" "priv-app" "GoogleServicesFramework"

# ── Framework ─────────────────────────────────────────────────────────────────

echo ""
echo "── Installing framework ─────────────────────────────────────────────────"

copy_config \
    "${FILES_DIR}/framework/com.google.android.maps.jar" \
    "${SYSTEM_DIR}/framework/com.google.android.maps.jar"

# ── Permissions ───────────────────────────────────────────────────────────────

echo ""
echo "── Installing permissions ───────────────────────────────────────────────"

copy_config \
    "${FILES_DIR}/permissions/com.google.android.maps.xml" \
    "${SYSTEM_DIR}/etc/permissions/com.google.android.maps.xml"

copy_config \
    "${FILES_DIR}/permissions/privapp-permissions-GmsCore.xml" \
    "${SYSTEM_EXT_DIR}/etc/permissions/privapp-permissions-GmsCore.xml"

# ── Sysconfig ─────────────────────────────────────────────────────────────────

echo ""
echo "── Installing sysconfig ─────────────────────────────────────────────────"

copy_config \
    "${FILES_DIR}/sysconfig/google.xml" \
    "${SYSTEM_EXT_DIR}/etc/sysconfig/google.xml"

# ── Default permissions ───────────────────────────────────────────────────────

echo ""
echo "── Installing default permissions ───────────────────────────────────────"

copy_config \
    "${FILES_DIR}/default-permissions/default-permissions-GmsCore.xml" \
    "${SYSTEM_EXT_DIR}/etc/default-permissions/default-permissions-GmsCore.xml"

# ── microG config ─────────────────────────────────────────────────────────────

echo ""
echo "── Installing microG config ─────────────────────────────────────────────"

copy_config \
    "${FILES_DIR}/etc/microg.xml" \
    "${SYSTEM_EXT_DIR}/etc/microg.xml"

# ── MtkSettingsProvider ───────────────────────────────────────────────────────
# Only replace if the source files are confirmed to match this exact firmware.
# Using mismatched .odex/.vdex WILL cause bootloop.
# To enable: verify the APK/odex/vdex come from this same stock firmware build.

# echo ""
# echo "── MtkSettingsProvider ──────────────────────────────────────────────────"
# MTKSETTINGS_SRC="${FILES_DIR}/MtkSettingsProvider"
# MTKSETTINGS_DEST="${SYSTEM_EXT_DIR}/priv-app/MtkSettingsProvider"
# if [ ! -f "${MTKSETTINGS_SRC}/MtkSettingsProvider.apk" ]; then
#     echo "[⚠️]  MtkSettingsProvider.apk not found — keeping stock"
# elif [ ! -f "${MTKSETTINGS_SRC}/oat/arm64/MtkSettingsProvider.odex" ] || \
#      [ ! -f "${MTKSETTINGS_SRC}/oat/arm64/MtkSettingsProvider.vdex" ]; then
#     echo "[⚠️]  MtkSettingsProvider .odex/.vdex missing — keeping stock to avoid bootloop"
# else
#     sudo rm -rf "$MTKSETTINGS_DEST"
#     sudo cp -r "$MTKSETTINGS_SRC" "${SYSTEM_EXT_DIR}/priv-app/"
#     set_permissions_recursive "$MTKSETTINGS_DEST"
#     echo "[✅] MtkSettingsProvider replaced"
# fi

echo ""
echo "[✅] microG installation complete"