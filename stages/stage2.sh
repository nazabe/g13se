#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "[!] Incorrect arguments!"
    echo "     Using: $0 <FS> <UNPACKED_DIR>"
    exit 1
fi

smount() {
    DIR=$1

    sudo mount -t $FS -o loop "${UNPACKED_DIR}/${DIR}.img" "${MNT_BASE}/${DIR}"
    echo "[STAGE 2] ${DIR} partition mounted"
}

FS=$1
UNPACKED_DIR=$2
MNT_BASE="${2}/mnt"
MNT_PARTITIONS=("system_a" "product_a" "system_ext_a" "vendor_a")

if [ ! -d "$MNT_BASE" ]; then
    mkdir -p "$MNT_BASE"
    echo "[+] Directory $MNT_BASE created"
else
    echo "[?] Directory $MNT_BASE already exists"
fi

# Resize vendor_a to ensure enough space for modifications (Camelia Brightness Fix)
echo "[⚙️] Resizing vendor_a.img to ensure free space..."
e2fsck -f "${UNPACKED_DIR}/vendor_a.img" -y
resize2fs "${UNPACKED_DIR}/vendor_a.img" $(($(du -m "${UNPACKED_DIR}/vendor_a.img" | cut -f1) + 1))M

for dir in "${MNT_PARTITIONS[@]}"; do
    if [ ! -d "${MNT_BASE}/$dir" ]; then
        mkdir -p "${MNT_BASE}/$dir"
        echo "[+] Directory $dir created"
    else
        echo "[?] Directory $dir already exists"
    fi
    smount "${dir}"
done

echo " "
echo "[-] - Removed"
echo "[+] - Added"
echo "[=] - Modified"
echo " "

./scripts/remove_bloatware/main.sh $MNT_BASE
./scripts/modify_configs/configs.sh $MNT_BASE
./scripts/modify_configs/props.sh $MNT_BASE
./scripts/install_apks/install_apks.sh $MNT_BASE

# NOTE: Nothing of this modules works...
# ./scripts/nav_overlay/nav_overlay.sh $MNT_BASE
# ./scripts/fonts/fonts.sh $MNT_BASE 
# ./scripts/brightness_fix/brightness_fix.sh $MNT_BASE

# ./scripts/signature_spoof/signature_spoof.sh $MNT_BASE
# ./scripts/microg/microg.sh $MNT_BASE

echo "All images unmounted"
sudo umount ${MNT_BASE}/*
