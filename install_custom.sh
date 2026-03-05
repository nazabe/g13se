#!/bin/bash
FIRMWARE_DIR="$1"  # directorio con vbmeta imgs del stock
DIR="unpacked"

echo "Custom G13SE ROM Installer"

# Deshabilitar AVB
fastboot flash --disable-verity --disable-verification vbmeta "$FIRMWARE_DIR/vbmeta.img"
fastboot flash --disable-verity --disable-verification vbmeta_system "$FIRMWARE_DIR/vbmeta_system.img"
fastboot flash --disable-verity --disable-verification vbmeta_vendor "$FIRMWARE_DIR/vbmeta_vendor.img"

fastboot reboot bootloader
sleep 5

# Flashear super custom
fastboot flash super "$DIR/super_custom.img"

# Limpiar userdata
fastboot erase userdata
fastboot erase metadata

fastboot reboot