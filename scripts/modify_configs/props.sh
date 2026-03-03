#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <BASE_DIR>"
    exit 1
fi

BASE_DIR=$1

BUILD_PROP="${BASE_DIR}/system_a/system/build.prop"

ADD_PROP_LIST=(
    # ── Existing props ──────────────────────────────────────────
    "persist.camera.HAL3.enabled=1"                 # Enable Camera2 API
    "debug.hwui.render_dirty_regions=false"         # Disable dirty region (Mali GPU)
    "debug.sf.skip_dirty_regions=1"
    "debug.sf.nobootanimation=1"                    # Disable boot animation
    "persist.adb.notify=0"                          # Disable ADB connection notification
    "ro.max.fling_velocity=18000"                   # Max swipe speed
    "ro.min.fling_velocity=12000"                   # Min swipe speed
    "debug.sf.hw=1"                                 # Force hardware acceleration
    "ro.telephony.call_ring.delay=0"                # Remove call ring delay
    "ro.media.enc.jpeg.quality=100"                 # Max JPEG quality
    "ro.setupwizard.mode=DISABLE"                   # Skip SetupWizard (temporary solution for MicroG)

    # ── Performance ─────────────────────────────────────────────
    "ro.vendor.qti.sys.fw.bg_apps_limit=80"         # Allow more background apps (4GB RAM)
    "ro.sys.fw.bg_apps_limit=80"
    "dalvik.vm.heapstartsize=16m"                   # Smoother app startup
    "dalvik.vm.heapgrowthlimit=384m"                # Tuned for 4GB RAM
    "dalvik.vm.heapsize=768m"                       # Tuned for 4GB RAM
    "dalvik.vm.heaptargetutilization=0.75"
    "dalvik.vm.heapminfree=8m"                      # Tuned for 4GB RAM
    "dalvik.vm.heapmaxfree=32m"                     # Tuned for 4GB RAM
    "ro.config.avoid_gfx_accel=false"
    "debug.hwui.use_partial_updates=false"          # Reduce GPU stutter
    "persist.sys.composition.type=gpu"              # Force GPU composition

    # ── RAM & LMKD (complements PSI Magisk module) ──────────────
    "ro.lmk.use_psi=true"                           # Enable PSI mode in LMKD
    "ro.lmk.use_minfree_levels=false"               # Disable legacy minfree levels
    "ro.lmk.low=1001"
    "ro.lmk.medium=900"                             # Tuned for 4GB RAM
    "ro.lmk.critical=0"
    "ro.lmk.critical_upgrade=false"
    "ro.lmk.upgrade_pressure=100"
    "ro.lmk.downgrade_pressure=100"
    "ro.lmk.kill_heaviest_task=true"
    "ro.lmk.kill_timeout_ms=100"

    # ── I/O & Storage ───────────────────────────────────────────
    "ro.config.hw_fast_dormancy=1"                  # Faster modem dormancy
    "persist.sys.use_dithering=1"

    # ── Battery ─────────────────────────────────────────────────
    "ro.config.hw_power_saving=1"
    "pm.sleep_mode=1"
    "ro.ril.disable.power.collapse=0"
    "persist.radio.add_power_save=1"

    # ── UI / Smoothness ─────────────────────────────────────────
    "ro.surface_flinger.use_content_detection_for_refresh_rate=true" # Dynamic refresh rate
    "ro.surface_flinger.set_idle_timer_ms=500"
    "ro.surface_flinger.set_touch_timer_ms=500"
    "ro.surface_flinger.set_display_power_timer_ms=1000"
    "debug.choreographer.skipwarning=10"                             # Suppress frame skip warnings in logs
    "windowsmgr.max_events_per_sec=500"                              # Smoother touch response
    "ro.min_pointer_dur=8"
    "view.touch_slop=8"

    # ── Network & Data ───────────────────────────────────────────
    "net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960"
    "net.tcp.buffersize.wifi=524288,1048576,2097152,262144,524288,1048576"
    "net.tcp.buffersize.lte=524288,1048576,2097152,262144,524288,1048576"
    "net.tcp.buffersize.umts=4096,87380,376320,4096,16384,110208"

    # ── Privacy / DeGoogle ───────────────────────────────────────
    "ro.setupwizard.enterprise_mode=1"              # Reinforce SetupWizard skip
    "ro.com.google.clientidbase="                   # Clear Google client ID
    "ro.error.receiver.system.apps="                # Disable error reporting to Google
    "ro.config.nocheckin=1"                         # Disable Google checkin
    "net.hostname=localhost"                        # Hide hostname on local network

    # ── GCam / Camera2 API ───────────────────────────────────────
    "persist.camera.privapp.list=org.codeaurora.snapcam"
    "media.camera.ts.monotonic=1"
    "persist.camera.gyro.android=4"                 # Enable gyroscope for GCam
    "persist.camera.eis.enable=1"                   # Enable Electronic Image Stabilization
    "persist.camera.is_type=4"
)

append_prop() {
    if ! sudo grep -q "${1}" "$BUILD_PROP"; then
        echo "[+] Adding prop '${1}' to "${2}""
        sudo sed -i "$ a ${1}" "$BUILD_PROP"
    else
        echo "[i] Prop '${1}' is already present in "${2}""
    fi
}

remove_prop() {
    if sudo grep -q "^${1}" "${2}"; then
        echo "[-] Removing prop '${1}' from "${2}""
        sudo sed -i "/^${1}/d" "${2}"
    else
        echo "[i] Prop '${1}' is not present in "${2}""
    fi
}

edit_prop() {
    prop_name="${1%%=*}"
    new_value="${1#*=}"
    if sudo grep -q "${prop_name}=" "${2}"; then
        current_value=$(sudo grep "^${prop_name}=" "${2}" | cut -d'=' -f2)
        if [ "$current_value" != "$new_value" ]; then
            echo "[=] Editing prop '${prop_name}' in "${2}""
            sudo sed -i "s/${prop_name}=.*/${prop_name}=${new_value}/" "${2}"
        else
            echo "[*] Prop '${prop_name}' already has the desired value (${new_value}) in "${2}""
        fi
    else
        echo "[i] Prop '${prop_name}' is not present in "${2}""
    fi
}

# TWEAKS SECTION

## BUILD.PROP
append_prop "# Moto g13se build.prop tweaks"
for prop in "${ADD_PROP_LIST[@]}"; do
    append_prop "$prop" "${BUILD_PROP}"
done
