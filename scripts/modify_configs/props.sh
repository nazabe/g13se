#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <BASE_DIR>"
    exit 1
fi

BASE_DIR=$1

BUILD_PROP="${BASE_DIR}/system_a/system/build.prop"

# Props that DO NOT exist in stock build.prop — safe to append
ADD_PROP_LIST=(
    # ── Camera ──────────────────────────────────────────────────
    "persist.camera.HAL3.enabled=1"                 # Enable Camera2 API
    "persist.camera.privapp.list=org.codeaurora.snapcam"
    "media.camera.ts.monotonic=1"
    "persist.camera.gyro.android=4"                 # Enable gyroscope for GCam
    "persist.camera.eis.enable=1"                   # Enable Electronic Image Stabilization
    "persist.camera.is_type=4"

    # ── SurfaceFlinger ───────────────────────────────────────────
    "debug.sf.skip_dirty_regions=1"
    "debug.sf.nobootanimation=1"                    # Disable boot animation
    "debug.sf.hw=1"                                 # Force hardware acceleration

    # ── UI / Smoothness ─────────────────────────────────────────
    "ro.surface_flinger.use_content_detection_for_refresh_rate=false" # 90hz screen aproach
    # "ro.surface_flinger.set_idle_timer_ms=500"
    # "ro.surface_flinger.set_touch_timer_ms=500"
    # "ro.surface_flinger.set_display_power_timer_ms=1000"
    "debug.choreographer.skipwarning=10"            # Suppress frame skip warnings in logs
    "windowsmgr.max_events_per_sec=500"             # Smoother touch response
    "ro.min_pointer_dur=8"
    "view.touch_slop=8"
    "ro.max.fling_velocity=18000"                   # Max swipe speed
    "ro.min.fling_velocity=12000"                   # Min swipe speed

    # ── GPU ──────────────────────────────────────────────────────
    "debug.hwui.render_dirty_regions=false"         # Disable dirty region (Mali GPU)
    "debug.hwui.use_partial_updates=false"          # Reduce GPU stutter
    "ro.config.avoid_gfx_accel=false"
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
    "ro.vendor.qti.sys.fw.bg_apps_limit=80"         # Allow more background apps (4GB RAM)
    "ro.sys.fw.bg_apps_limit=80"

    # ── Dalvik heap (stock has these commented out, appending active versions) ──
    "dalvik.vm.heapstartsize=16m"
    "dalvik.vm.heaptargetutilization=0.75"
    "dalvik.vm.heapminfree=8m"                      # Tuned for 4GB RAM
    "dalvik.vm.heapmaxfree=32m"                     # Tuned for 4GB RAM

    # ── I/O & Storage ───────────────────────────────────────────
    "ro.config.hw_fast_dormancy=1"                  # Faster modem dormancy
    "persist.sys.use_dithering=1"

    # ── Battery ─────────────────────────────────────────────────
    "ro.config.hw_power_saving=1"
    "pm.sleep_mode=1"
    "ro.ril.disable.power.collapse=0"
    "persist.radio.add_power_save=1"

    # ── Telephony ───────────────────────────────────────────────
    "ro.telephony.call_ring.delay=0"                # Remove call ring delay
    "persist.adb.notify=0"                          # Disable ADB connection notification

    # ── Media ────────────────────────────────────────────────────
    "ro.media.enc.jpeg.quality=100"                 # Max JPEG quality

    # ── Network & Data ───────────────────────────────────────────
    "net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960"
    "net.tcp.buffersize.wifi=524288,1048576,2097152,262144,524288,1048576"
    "net.tcp.buffersize.lte=524288,1048576,2097152,262144,524288,1048576"
    "net.tcp.buffersize.umts=4096,87380,376320,4096,16384,110208"

    # ── Privacy / DeGoogle ───────────────────────────────────────
    "ro.setupwizard.enterprise_mode=1"              # Reinforce SetupWizard skip
    "ro.error.receiver.system.apps="                # Disable error reporting to Google
    "ro.config.nocheckin=1"                         # Disable Google checkin
    "net.hostname=localhost"                        # Hide hostname on local network

    # ── SetupWizard ──────────────────────────────────────────────
    "ro.setupwizard.mode=DISABLE"                   # Skip SetupWizard (temporary solution for MicroG)

    # ── Android 14 Features ──────────────────────────────────────
    "persist.sys.predictive_back=1"              # Predictive back gesture animation
    "ro.predictive_back_gesture_enabled=1"       # Enables the pullback animation
    "persist.wm.debug.predictive_back=1"         # Activation force in WM

    # ── Lockscreen ───────────────────────────────────────────────
    # "persist.sys.keyguard.clock_face=digital_clock"  # Modern clock style
    # "ro.lockscreen.widgets.enabled=true"             # Enable widgets on lockscreen

    # ── Fuentes y UI ─────────────────────────────────────────────
    "persist.sys.ui.hw=true"                     # Hardware acceleration throughout the UI
    "ro.config.ringtone_haptics=1"               # Haptics on notifications

    # ── Media player en notificaciones ──────────────────────────
    # "persist.sys.media_controls_lockscreen=true" # New media player on lockscreen

    persist.sys.force_enable_compat_fake_focus=1
    persist.sys.navbar.height=0
    persist.wm.extensions.enabled=true
    android.window.extensions.version=3
)

# Props that ALREADY EXIST in stock build.prop — must use edit_prop to avoid duplicates
EDIT_PROP_LIST=(
    # ── Dalvik heap (stock has these commented, but active versions must be edited) ──
    "dalvik.vm.heapgrowthlimit=384m"                # Stock: commented #dalvik.vm.heapgrowthlimit=256m
    "dalvik.vm.heapsize=768m"                       # Stock: commented #dalvik.vm.heapsize=512m

    # ── Dalvik runtime ───────────────────────────────────────────
    "dalvik.vm.usap_pool_enabled=true"              # Stock: false — reduces process fork latency
    "dalvik.vm.useartservice=true"                  # Stock: true — already correct, no change

    # ── dex2oat / dexopt ────────────────────────────────────────
    "pm.dexopt.first-boot=verify"
    "pm.dexopt.boot-after-ota=verify"

    # ── Privacy / DeGoogle ───────────────────────────────────────
    "ro.com.google.clientidbase="                   # Stock: android-motorola — must edit, not append
    "persist.traced.enable=0"                       # Stock: 1 — disable Android tracing daemon

    # ── Zygote ───────────────────────────────────────────────────
    "ro.zygote.preload.enable=1"                    # Stock: 0 — preload classes, faster app launch

    # ── Audio ────────────────────────────────────────────────────
    "ro.audio.silent=0"                             # Stock: already 0, but exists — edit to be safe

    # ── SetupWizard (stock has this enabled) ─────────────────────
    "setupwizard.feature.baseline_setupwizard_enabled=false" # Stock: true

    # ── Refresh Rate to 90hz ─────────────────────────────────────
    "ro.surface_flinger.set_frame_rate_multiple_threshold=0"
    "debug.sf.set_idle_timer_ms=0"

    "ro.surface_flinger.enable_frame_rate_override=true"  # Allows you to disable FPS per application

    "qemu.hw.mainkeys=0"

    "ro.setupwizard.mode=DISABLED"
)

append_prop() {
    if ! sudo grep -q "^${1%%=*}=" "$BUILD_PROP" && ! sudo grep -q "^${1}$" "$BUILD_PROP"; then
        echo "[+] Adding prop '${1}'"
        sudo sed -i "$ a ${1}" "$BUILD_PROP"
    else
        echo "[i] Prop '${1%%=*}' already present, skipping"
    fi
}

remove_prop() {
    if sudo grep -q "^${1}" "${2}"; then
        echo "[-] Removing prop '${1}' from '${2}'"
        sudo sed -i "/^${1}/d" "${2}"
    else
        echo "[i] Prop '${1}' not present in '${2}'"
    fi
}

edit_prop() {
    prop_name="${1%%=*}"
    new_value="${1#*=}"
    # Handle commented-out props (e.g. #dalvik.vm.heapgrowthlimit=256m)
    if sudo grep -q "^#${prop_name}=" "$BUILD_PROP"; then
        echo "[=] Uncommenting and editing prop '${prop_name}'"
        sudo sed -i "s/^#${prop_name}=.*/${prop_name}=${new_value}/" "$BUILD_PROP"
    elif sudo grep -q "^${prop_name}=" "$BUILD_PROP"; then
        current_value=$(sudo grep "^${prop_name}=" "$BUILD_PROP" | cut -d'=' -f2)
        if [ "$current_value" != "$new_value" ]; then
            echo "[=] Editing prop '${prop_name}': '${current_value}' → '${new_value}'"
            sudo sed -i "s/^${prop_name}=.*/${prop_name}=${new_value}/" "$BUILD_PROP"
        else
            echo "[*] Prop '${prop_name}' already has desired value '${new_value}'"
        fi
    else
        echo "[i] Prop '${prop_name}' not found in stock, appending instead"
        sudo sed -i "$ a ${prop_name}=${new_value}" "$BUILD_PROP"
    fi
}

# ── APPLY TWEAKS ─────────────────────────────────────────────────────────────

echo ""
echo "── Appending new props ──────────────────────────────────────────────────"
sudo sed -i "$ a # Moto g13se build.prop tweaks" "$BUILD_PROP"
for prop in "${ADD_PROP_LIST[@]}"; do
    append_prop "$prop"
done

echo ""
echo "── Editing existing props ───────────────────────────────────────────────"
for prop in "${EDIT_PROP_LIST[@]}"; do
    edit_prop "$prop"
done