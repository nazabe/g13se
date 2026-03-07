#!/bin/bash
# FIRMWARE_DIR="$1"  # directorio con vbmeta imgs del stock
DIR="unpacked"

echo "Custom G13SE ROM Installer"

# img2simg unpacked/product_a.img unpacked/product_a_sparse.img
# img2simg unpacked/system_a.img unpacked/system_a_sparse.img
# img2simg unpacked/system_ext_a.img unpacked/system_ext_a_sparse.img
# img2simg unpacked/vendor_a.img unpacked/vendor_a_sparse.img

# # Empack super
# lpmake \
#   --device-size 8589934592 \
#   --metadata-size 65536 \
#   --metadata-slots 3 \
#   --block-size 4096 \
#   --sparse \
#   --virtual-ab \
#   --group main_a:6677622784 \
#   --group main_b:0 \
#   --partition product_a:readonly:2818850816:main_a \
#   --image product_a=unpacked/product_a_sparse.img \
#   --partition system_a:readonly:2007613440:main_a \
#   --image system_a=unpacked/system_a_sparse.img \
#   --partition system_ext_a:readonly:898002944:main_a \
#   --image system_ext_a=unpacked/system_ext_a_sparse.img \
#   --partition vendor_a:readonly:953155584:main_a \
#   --image vendor_a=unpacked/vendor_a_sparse.img \
#   --partition product_b:readonly:0:main_b \
#   --partition system_b:readonly:0:main_b \
#   --partition system_ext_b:readonly:0:main_b \
#   --partition vendor_b:readonly:0:main_b \
#   --output unpacked/super_custom.img

# Clean super partition
fastboot erase super

# Flashear super custom
fastboot flash super "$DIR/super_custom.img"

# Limpiar userdata
fastboot erase userdata
fastboot erase metadata

fastboot reboot