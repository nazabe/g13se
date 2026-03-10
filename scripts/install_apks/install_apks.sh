#!/bin/bash
# install_apks.sh — Instala APKs en la Custom ROM
# Estructura esperada:
#   scripts/install_apks/apps/       → product_a/app/
#   scripts/install_apks/priv-apps/  → product_a/priv-app/

if [ "$#" -ne 1 ]; then
    echo "[!] Uso: $0 <BASE_DIR>"
    exit 1
fi

BASE_DIR=$1
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

APPS_SRC="${SCRIPT_DIR}/apps"
PRIV_APPS_SRC="${SCRIPT_DIR}/priv-apps"

APPS_DST="${BASE_DIR}/product_a/app"
PRIV_APPS_DST="${BASE_DIR}/product_a/priv-app"

# TODO: Look for Gboard for altenatives
# Also, add MicroG, and quit Wireless Emergency Alert app if possible

set_permissions() {
    local path=$1
    sudo chown -R 0:0 "$path"
    # Directorios: 0755, archivos: 0644
    sudo find "$path" -type d -exec chmod 0755 {} \;
    sudo find "$path" -type f -exec chmod 0644 {} \;
    sudo find "$path" -exec setfattr -n security.selinux -v u:object_r:system_file:s0 {} \;
}

install_apks() {
    local src_dir=$1
    local dst_dir=$2
    local label=$3

    if [ ! -d "$src_dir" ]; then
        echo "[~] No hay APKs en ${label}, saltando..."
        return
    fi

    local count=0
    for apk in "${src_dir}"/*.apk; do
        [ -f "$apk" ] || continue

        app_name=$(basename "$apk" .apk)
        app_dst="${dst_dir}/${app_name}"

        echo "[=] Instalando ${app_name} en ${label}..."
        sudo mkdir -p "$app_dst"
        sudo cp "$apk" "${app_dst}/${app_name}.apk"
        set_permissions "$app_dst"

        count=$((count + 1))
    done

    echo "[i] ${count} APK(s) instalados en ${label}"
}

echo "[*] Instalando APKs en la ROM..."
install_apks "$APPS_SRC"      "$APPS_DST"      "product_a/app"
install_apks "$PRIV_APPS_SRC" "$PRIV_APPS_DST" "product_a/priv-app"
echo "[i] Instalación de APKs completada"