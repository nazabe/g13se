#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
FILES_DIR="${SCRIPT_DIR}/files"

SYSTEM_DIR="${MOUNT_DIR}/system_a/system"
PRODUCT_DIR="${MOUNT_DIR}/product_a"
SYSTEM_EXT_DIR="${MOUNT_DIR}/system_ext_a"

# ── Helpers ──────────────────────────────────────────────────────────────────

set_file_permissions() {
    sudo chown 0:0 "$1"
    sudo chmod 0644 "$1"
    sudo setfattr -n security.selinux -v "u:object_r:system_file:s0" "$1"
}

set_dir_permissions() {
    sudo chown 0:0 "$1"
    sudo chmod 0755 "$1"
    sudo setfattr -n security.selinux -v "u:object_r:system_file:s0" "$1"
}

# Install an APK as a system app
# Usage: install_apk <partition_dir> <subfolder: app|priv-app> <app_name>
install_apk() {
    local partition_dir=$1
    local subfolder=$2
    local app_name=$3
    local dest_dir="${partition_dir}/${subfolder}/${app_name}"
    local src_apk="${FILES_DIR}/${app_name}/${app_name}.apk"  # solo el APK

    if [ ! -f "$src_apk" ]; then
        echo "[❌] APK not found: $src_apk"
        return 1
    fi

    echo "[🔵] Installing ${app_name} → ${dest_dir}"
    sudo rm -rf "$dest_dir"
    sudo mkdir -p "$dest_dir"
    sudo cp "$src_apk" "${dest_dir}/${app_name}.apk"  # copia solo el .apk
    set_dir_permissions "$dest_dir"
    set_file_permissions "${dest_dir}/${app_name}.apk"
}

# Install arm64 native libs to system/lib64
# Usage: install_libs <app_name>
install_libs() {
    local app_name=$1
    local lib_dir="${FILES_DIR}/${app_name}/arm64-v8a"

    if [ ! -d "$lib_dir" ]; then
        return 0
    fi

    for lib in "$lib_dir"/*.so; do
        [ -f "$lib" ] || continue
        local lib_name=$(basename "$lib")
        echo "[🔵] Installing lib: ${lib_name}"
        sudo cp "$lib" "${SYSTEM_DIR}/lib64/${lib_name}"
        set_file_permissions "${SYSTEM_DIR}/lib64/${lib_name}"
    done
}

copy_config() {
    local src=$1
    local dest=$2
    echo "[=] Copying $(basename $src) → $dest"
    sudo cp "$src" "$dest"
    set_file_permissions "$dest"
}

# ── Installation ─────────────────────────────────────────────────────────────

echo ""
echo "── Installing MicroG ────────────────────────────────────────────────────"

# GmsCore (MicroG Play Services replacement)
install_apk "$PRODUCT_DIR" "priv-app" "GmsCore"
install_libs "GmsCore"

# Google Services Framework (GSF stub)
install_apk "$SYSTEM_EXT_DIR" "priv-app" "GoogleServicesFramework"

# PhoneSky (FakeStore — Play Store stub, prevents app crashes looking for Play Store)
install_apk "$PRODUCT_DIR" "priv-app" "PhoneSky"

echo ""
echo "── Installing framework files ───────────────────────────────────────────"

# Google Maps framework jar
copy_config \
    "${FILES_DIR}/framework/com.google.android.maps.jar" \
    "${SYSTEM_DIR}/framework/com.google.android.maps.jar"

echo ""
echo "── Installing permissions ───────────────────────────────────────────────"

# Maps permission
copy_config \
    "${FILES_DIR}/permissions/com.google.android.maps.xml" \
    "${SYSTEM_DIR}/etc/permissions/com.google.android.maps.xml"

# GmsCore privileged permissions
copy_config \
    "${FILES_DIR}/permissions/privapp-permissions-GmsCore.xml" \
    "${SYSTEM_EXT_DIR}/etc/permissions/privapp-permissions-GmsCore.xml"

echo ""
echo "── Installing sysconfig ─────────────────────────────────────────────────"

copy_config \
    "${FILES_DIR}/sysconfig/google.xml" \
    "${SYSTEM_EXT_DIR}/etc/sysconfig/google.xml"

echo ""
echo "── Installing default permissions ───────────────────────────────────────"

copy_config \
    "${FILES_DIR}/default-permissions/default-permissions-GmsCore.xml" \
    "${SYSTEM_EXT_DIR}/etc/default-permissions/default-permissions-GmsCore.xml"

echo ""
echo "── Installing MicroG config ─────────────────────────────────────────────"

copy_config \
    "${FILES_DIR}/etc/microg.xml" \
    "${SYSTEM_EXT_DIR}/etc/microg.xml"

echo ""
echo "── Replacing MtkSettingsProvider (patched for MicroG) ───────────────────"

MTKSETTINGS_SRC="${FILES_DIR}/MtkSettingsProvider"
MTKSETTINGS_DEST="${SYSTEM_EXT_DIR}/priv-app/MtkSettingsProvider"

if [ ! -f "${MTKSETTINGS_SRC}/MtkSettingsProvider.apk" ]; then
    echo "[⚠️] MtkSettingsProvider.apk not found, skipping"
else
    sudo rm -rf "$MTKSETTINGS_DEST"
    sudo mkdir -p "${MTKSETTINGS_DEST}/oat/arm64"

    sudo cp "${MTKSETTINGS_SRC}/MtkSettingsProvider.apk" "${MTKSETTINGS_DEST}/MtkSettingsProvider.apk"
    sudo cp "${MTKSETTINGS_SRC}/oat/arm64/MtkSettingsProvider.odex" "${MTKSETTINGS_DEST}/oat/arm64/MtkSettingsProvider.odex"
    sudo cp "${MTKSETTINGS_SRC}/oat/arm64/MtkSettingsProvider.vdex" "${MTKSETTINGS_DEST}/oat/arm64/MtkSettingsProvider.vdex"

    set_dir_permissions "$MTKSETTINGS_DEST"
    set_dir_permissions "${MTKSETTINGS_DEST}/oat"
    set_dir_permissions "${MTKSETTINGS_DEST}/oat/arm64"
    set_file_permissions "${MTKSETTINGS_DEST}/MtkSettingsProvider.apk"
    set_file_permissions "${MTKSETTINGS_DEST}/oat/arm64/MtkSettingsProvider.odex"
    set_file_permissions "${MTKSETTINGS_DEST}/oat/arm64/MtkSettingsProvider.vdex"

    echo "[+] MtkSettingsProvider replaced"
fi

echo ""
echo "[✅] MicroG installation complete"