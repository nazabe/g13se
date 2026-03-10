#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
BASE_DIR=$1

sudo cp "${SCRIPT_DIR}/AndroidClock.ttf" "${BASE_DIR}/system_a/system/fonts/AndroidClock.ttf"
sudo chown 0:0 "${BASE_DIR}/system_a/system/fonts/AndroidClock.ttf"
sudo chmod 0644 "${BASE_DIR}/system_a/system/fonts/AndroidClock.ttf"
sudo chcon "u:object_r:system_file:s0" "${BASE_DIR}/system_a/system/fonts/AndroidClock.ttf"