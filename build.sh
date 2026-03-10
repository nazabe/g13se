#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <SUPER_IMAGE>"
    exit 1
fi

SUPER_IMAGE=$1
UNPACKED_DIR="unpacked"

echo "Custom G13SE ROM Builder based on Stock"

SUPER_DIR=$(dirname "$SUPER_IMAGE")
SUPER_RAW="$SUPER_DIR/super_raw.img"

sudo umount unpacked/mnt/system_a unpacked/mnt/product_a unpacked/mnt/system_ext_a

if [ -d "$UNPACKED_DIR" ]; then
    echo "[🗑️] Removing old unpacked directory..."
    rm -rf "$UNPACKED_DIR"
fi

if [ -f "$SUPER_RAW" ]; then
    echo "[🗑️] Removing old super_raw.img..."
    rm -f "$SUPER_RAW"
fi

stage1() {
    if [ ! -d "$UNPACKED_DIR" ]; then
        echo "[⚙️] Proceeding to stage 1"
        ./stages/stage1.sh $SUPER_IMAGE $UNPACKED_DIR
        return
    fi

    if [ -n "$(find "$UNPACKED_DIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
        while true; do
            echo "[❓] There is already an unpacked super.img. Skip stage 1? (y/n)"
            read -r answer

            case "$answer" in
                y|Y)
                    echo "[ℹ️] Stage 1 is skipped. Already unpacked image is used"
                    return
                    ;;
                n|N)
                    echo "[⚙️] Running Stage 1..."
                    break
                    ;;
                *)
                    echo "[⚠️] Invalid input. Please enter 'y' or 'n'."
                    ;;
            esac
        done
        echo "[⚙️] Proceeding to stage 1"
        ./stages/stage1.sh $SUPER_IMAGE $UNPACKED_DIR
    fi
}

stage1

echo "[⚙️] Proceeding to stage 2"
./stages/stage2.sh "ext4" "${UNPACKED_DIR}"

img2simg unpacked/product_a.img unpacked/product_a_sparse.img
img2simg unpacked/system_a.img unpacked/system_a_sparse.img
img2simg unpacked/system_ext_a.img unpacked/system_ext_a_sparse.img
img2simg unpacked/vendor_a.img unpacked/vendor_a_sparse.img

# Empack super
lpmake \
  --device-size 8589934592 \
  --metadata-size 65536 \
  --metadata-slots 3 \
  --block-size 4096 \
  --sparse \
  --virtual-ab \
  --group main_a:6677622784 \
  --group main_b:0 \
  --partition product_a:readonly:2818850816:main_a \
  --image product_a=unpacked/product_a_sparse.img \
  --partition system_a:readonly:2007613440:main_a \
  --image system_a=unpacked/system_a_sparse.img \
  --partition system_ext_a:readonly:898002944:main_a \
  --image system_ext_a=unpacked/system_ext_a_sparse.img \
  --partition vendor_a:readonly:953155584:main_a \
  --image vendor_a=unpacked/vendor_a_sparse.img \
  --partition product_b:readonly:0:main_b \
  --partition system_b:readonly:0:main_b \
  --partition system_ext_b:readonly:0:main_b \
  --partition vendor_b:readonly:0:main_b \
  --output unpacked/super_custom.img