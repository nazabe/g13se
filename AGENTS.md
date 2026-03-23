# AGENTS.md — Moto G13SE Custom ROM Builder

This file provides full context for AI agents working on this project.
Read this entire file before making any changes or running any commands.

---

## Project Overview

A custom ROM builder for the **Motorola Moto G13SE (codename: penangf)** based on the official
stock Android 14 firmware. The goal is NOT to build a full AOSP ROM from source, but to
**modify, debloat, and optimize the stock firmware** at the partition level before flashing.

The project repackages the `super.img` logical partition with modified system, product,
system_ext, and vendor partitions. It produces a flashable custom `super.img` via `lpmake`.

---

## Device Specifications

| Property | Value |
|---|---|
| Device | Motorola Moto G13SE |
| Codename | penangf |
| SoC | MediaTek Helio G85 (MT6768) |
| CPU | 2x Cortex-A75 2.0 GHz + 6x Cortex-A55 1.8 GHz, ARM64 |
| GPU | Mali-G52 MC2 1000 Mhz |
| RAM | 4GB LPDDR4X |
| Storage | 128GB eMMC |
| Android | 14 |
| Firmware | UHAS34.29-29 |
| Serial | ZY22GKF3NB |
| Bootloader | unlocked:yes, secure:no |
| fastbootd | supported |
| TWRP | Installed and working |
| Magisk | v30.7, installed as user app (not system app) |

---

## Repository Structure

```
.
├── build.sh                          # Main entry point
├── install_custom.sh                 # Repackages and flashes super.img
├── sigspoof_patch.py                 # Signature spoofing patch script
├── stages/
│   ├── stage1.sh                     # simg2img + lpunpack
│   └── stage2.sh                     # Mount images, run scripts, unmount
├── scripts/
│   ├── remove_bloatware/
│   │   ├── main.sh                   # Bloatware removal
│   │   └── bloatware.json            # Bloatware removal config
│   ├── modify_configs/
│   │   ├── configs.sh                # Remove .xml of removed bloatware
│   │   └── props.sh                  # build.prop tweaks
│   ├── signature_spoof/
│   │   ├── signature_spoof.sh        # Copies patched framework.jar + org.spoofing.apk
│   │   ├── framework_patched.jar     # Patched framework.jar (signature spoofing)
│   │   ├── services.odex             # File generated via dex2oat64
│   │   ├── services.vdex             # File generated via dex2oat64
│   │   └── org.spoofing.apk          # Spoofing permission APK
│   ├── brightness_fix/               # (DISABLED — Doesn't work)
│   │   ├── brightness_fix.sh         # Camellia Brightness Fix integration
│   │   └── Camellia_Brightness_Fix_V2_Beta.zip
│   ├── microg/
│   │   ├── microg.sh                 # MicroG installation script
│   │   └── files/                    # MicroG APKs and config files
│   ├── install_apks/
│   │   ├── install_apks.sh           # Installs APKs from subdirs
│   │   ├── apps/                     # → product_a/app/ (OpenBoard, QKSMS, GCam, etc.)
│   │   └── priv-apps/                # → product_a/priv-app/ (Probably MicroG GMS Core)
│   ├── fonts/                        # (DISABLED — Doesn't work)
│   │   └── fonts.sh                  # Font replacement script
│   └── nav_overlay/
│       └── nav_overlay.sh            # RRO overlay (DISABLED — caused bootloop)
└── unpacked/
    └── mnt/
        ├── system_a/
        ├── product_a/
        ├── system_ext_a/
        └── vendor_a/
```

---

## Build Pipeline

### How it works

1. `build.sh` calls `stage1.sh` then `stage2.sh`
2. `stage1.sh` — converts `super.img` with `simg2img`, unpacks logical partitions with `lpunpack`
3. `stage2.sh` — mounts ext4 images as loop devices, runs all scripts, unmounts
4. `install_custom.sh` — converts images with `img2simg`, repackages with `lpmake`, flashes via fastboot

### lpmake parameters (confirmed working)

```bash
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
```

### Important notes

- Partitions are **logical inside super** — cannot be flashed directly, must be repackaged
- fastbootd is NOT supported on this device — must flash super.img directly via fastboot
- `vendor_a.img` was resized +1MB before mounting to fit the Camellia brightness fix binary
- First boot after framework.jar changes takes longer due to ART dex recompilation (up to 10 min)

---

## Bloatware Removal

Configuration file: `bloatware.json`

### Structure

```json
{
  "product_a": [...],
  "system_a": [...],
  "system_ext_a": [...]
}
```

Each entry:
```json
{
  "path": "relative/path/from/partition/root",
  "description": "explanation",
  "remove": true
}
```

### Critical entries — NEVER set remove:true

| App | Reason |
|---|---|
| `system_ext_a/priv-app/SetupWizard` | Removing causes Settings crash, broken home, broken QS |
| `system_a/priv-app/MotoLauncher` | Removing breaks home gesture |
| `product_a/app/com.google.android.modulemetadata` | Causes bootloop if removed |
| `system_ext_a/priv-app/GoogleServicesFramework` | Keep until MicroG GSF replacement confirmed |
| `product_a/priv-app/GmsCore` | Keep until MicroG confirmed working |
| `product_a/priv-app/Phonesky` | Keep until switching to F-Droid + MicroG |

### Pending bloatware entries to add

- `product_a/priv-app/CarrierSettings`
- `product_a/priv-app/ConfigUpdater`
- `product_a/priv-app/CrossDeviceServices`
- `product_a/priv-app/GoogleCarrierWifi`
- `product_a/priv-app/ImsServiceEntitlement`
- `product_a/app/NonFrameworkLbs`
- `system_ext_a/priv-app/DeviceManagement`
- `system_ext_a/priv-app/LPPeService`
- `system_ext_a/priv-app/ModemStatsService`
- `system_ext_a/priv-app/MtkGbaService`
- `system_ext_a/priv-app/Wellbeing` (if present)

---

## Signature Spoofing — STATUS: WORKING

The signature spoofing patch is confirmed working on this device.

### How it works

- `ApplicationPackageManager` in `framework.jar` (`classes.dex`) was patched
- The patch adds a `spoofSignature()` method that checks for `fake-signature` metadata
- `org.spoofing.apk` provides the permission framework

### Key findings

- `ApplicationPackageManager` is in `classes.dex` of `framework.jar` (NOT `services.jar`)
- `framework.jar` has 5 dex files: `classes.dex` through `classes5.dex`, total 39MB
- The original `classes.dex` is dex version `039` — smali must use `-a 28` flag to produce `039`
- Patching only `classes.dex` and replacing it inside the original jar works correctly
- Deleting `oat/arm64/framework.odex` and `oat/arm64/framework.vdex` is NOT needed on this device

### Lessons learned (do not repeat these mistakes)

- **DO NOT** disassemble the entire `framework.jar` with baksmali — smali 3.0.9 cannot reassemble
  Android 14 dex files with Hidden API annotations (`blacklist`, `greylist-max-o`, etc.)
- **DO NOT** use `-a 34` with smali — produces dex version `040` which ART rejects on this firmware
- **DO** use `--classes "Landroid/app/ApplicationPackageManager;"` to disassemble only the target class
- **DO** strip Hidden API annotations from fields AND methods before reassembling
- **DO** replace only `classes.dex` inside the original jar, keeping all other dex files intact

### Patch process (for regenerating after firmware update)

```bash
# 1. Extract classes.dex from original framework.jar
mkdir -p /tmp/framework_dex
unzip unpacked/mnt/system_a/system/framework/framework.jar classes.dex -d /tmp/framework_dex

# 2. Disassemble only ApplicationPackageManager
mkdir -p /tmp/single_class_clean
java -jar ~/Downloads/baksmali-3.0.9-fat-release.jar disassemble \
    -a 28 \
    --classes "Landroid/app/ApplicationPackageManager;" \
    /tmp/framework_dex/classes.dex \
    -o /tmp/single_class_clean

# 3. Apply patch
python3 sigspoof_patch.py  # update path in script to /tmp/single_class_clean/...

# 4. Strip Hidden API annotations
python3 << 'EOF'
import re
with open('/tmp/single_class_clean/android/app/ApplicationPackageManager.smali', 'r') as f:
    content = f.read()
hidden_api_tags = ['blacklist', 'whitelist', 'greylist', 'greylist-max-o',
    'greylist-max-p', 'greylist-max-q', 'greylist-max-r',
    'greylist-max-s', 'greylist-max-t', 'unsupported']
for tag in hidden_api_tags:
    content = re.sub(r'(\.(method|field)[^#\n]*)\b' + re.escape(tag) + r'\b', r'\1', content)
    content = re.sub(r'(\.(method|field)) {2,}', r'\1 ', content)
with open('/tmp/single_class_clean/android/app/ApplicationPackageManager.smali', 'w') as f:
    f.write(content)
EOF

# 5. Reassemble only that class
java -jar ~/Downloads/smali-3.0.9-fat-release.jar assemble \
    -a 28 \
    /tmp/single_class_clean/ \
    -o /tmp/classes_patched.dex

# Verify dex version is 039
xxd /tmp/classes_patched.dex | head -1  # Should show: dex.039

# 6. Replace classes.dex inside a copy of the original jar
cp unpacked/mnt/system_a/system/framework/framework.jar /tmp/framework_patched.jar
cp /tmp/classes_patched.dex /tmp/classes.dex
cd /tmp && zip framework_patched.jar classes.dex

# 7. Copy to project
cp /tmp/framework_patched.jar scripts/signature_spoof/framework_patched.jar
```

---

## MicroG — STATUS: PENDING

MicroG installation is the next major milestone.

### Planned approach

1. Build ROM with `GmsCore` and `Phonesky` set to `remove:true` in bloatware.json
2. Flash clean ROM via TWRP
3. Install NanoDroid via TWRP (microG-only mode) to let it handle installation
4. Verify MicroG works — Self-Check green, Google account login working
5. Extract all installed files via ADB:

```bash
adb pull /system/app/ /tmp/nanodroid_dump/system_app/
adb pull /system/priv-app/ /tmp/nanodroid_dump/system_priv_app/
adb pull /system/framework/ /tmp/nanodroid_dump/framework/
adb pull /system/etc/permissions/ /tmp/nanodroid_dump/permissions/
adb pull /system/etc/sysconfig/ /tmp/nanodroid_dump/sysconfig/
adb pull /system/etc/default-permissions/ /tmp/nanodroid_dump/default_permissions/

# Also extract SELinux contexts
adb shell ls -laZ /system/priv-app/GmsCore/
adb shell ls -laZ /system/framework/
```

6. Replicate exact file structure, permissions, and SELinux contexts in `scripts/microg/`

### Current microg.sh file structure

```
scripts/microg/files/
├── priv-app/GmsCore/
├── priv-app/GoogleServicesFramework/
├── priv-app/PhoneSky/
├── priv-app/MtkSettingsProvider/
├── framework/com.google.android.maps.jar
├── permissions/
├── sysconfig/
├── default-permissions/
└── etc/microg.xml
```

### Warning about NanoDroid

NanoDroid's last stable release is from January 2021. Its signature spoofing patcher
only supports Android up to 9.x. Use NanoDroid **only as a MicroG installer**, not as
a patcher — signature spoofing is already handled natively in this ROM.

---

## build.prop Optimizations

Script: `scripts/modify_configs/props.sh`

### ADD_PROP_LIST (appended to build.prop)

- Camera HAL3 enabled
- SurfaceFlinger 90Hz fixed (`ro.surface_flinger.use_content_detection_for_refresh_rate=false`)
- LMKD PSI mode (`ro.lmk.use_psi=true`)
- Network buffers optimized for LTE/WiFi
- Privacy/DeGoogle props
- Android 14 predictive back gesture
- Dalvik heap: 384m start, 768m max
- `dalvik.vm.usap_pool_enabled=true`
- `ro.surface_flinger.max_frame_buffer_acquired_buffers=3`
- HWUI texture cache tuned for Mali-G52 MC2
- VM tweaks: `vm.swappiness=100`, `vm.dirty_ratio=20`, `vm.vfs_cache_pressure=50`
- `sys.use_fifo_ui=1`
- `ro.config.max_starting_bg=8`

### EDIT_PROP_LIST (modified in existing build.prop)

- `pm.dexopt.first-boot=verify` (NOT speed-profile — causes bootloop on first boot)
- `pm.dexopt.boot-after-ota=verify`
- `traced.enable=0`
- `zygote.preload.enable=1`
- SetupWizard disabled

---

## Preinstalled Apps

### Apps added (scripts/install_apks/apps/)

| App | Replaces |
|---|---|
| OpenBoard v1.4.5 (Planned to move to a mantained keyboard app) | Gboard (LatinImeGoogle) |
| QUIK v4.3.4 | Google Messages |
| LMC8.4 GCam | MotoCamera (optional, stock camera kept) |

### Apps kept (remove:false in bloatware.json)

| App | Reason |
|---|---|
| Moto Camera | Required for Macro and 50MP (unavailable in GCam) |
| Google Calculator | No telemetry, best option available |
| Google Clock | Native, fully system-integrated |
| Digital Wellbeing | Kept for its widget |
| MotoLauncher | Required for home gesture to work |

### Magisk note

Magisk MUST be installed as a user app, not a system app:
```bash
adb shell pm uninstall --user 0 com.topjohnwu.magisk  # remove system version
# Then reinstall APK normally via ADB or sideload
```

---

## Camellia Brightness Fix

- Binary: `vendor_a/bin/hw/android.hardware.lights-service.mediatek`
- Source: `scripts/brightness_fix/Camellia_Brightness_Fix_V2_Beta.zip`
- `vendor_a.img` must be resized +1MB before mounting to fit the binary
- Status: Working

---

## Font Customization

- Script: `scripts/fonts/fonts.sh`
- The lockscreen clock font on Android 12+ lives in `system/product/fonts/GoogleSansClock-Regular.ttf`
- NOT in `system/fonts/` — that's why previous attempts failed
- Current font: Morganite-Black.ttf (renamed to GoogleSansClock-Regular.ttf)
- The original `GoogleSansClock-Regular.ttf` is actually **Nabla Regular** (variable font with COLR/SVG)
- Morganite-Black is a standard TTF (366 glyphs) — compatible with Android 14
- Also available as Magisk module: `Morganite-Clock-Font.zip`

---

## Navigation Bar / Gesture Gap

**Known limitation — cannot be fixed.**

The 38px mandatory system gestures inset (`mandatorySystemGestures`) is hardcoded in Android 14.
The following approaches were attempted and failed:

- Props: `persist.sys.navbar.height=0`, `qemu.hw.mainkeys=0`, various window extension props
- RRO overlay with `navigation_bar_height=0dip` — bootloop
- RRO overlay with `navigation_bar_height=8dip` — no effect
- `persist.sys.force_enable_compat_fake_focus=1` — partial, gap persists

Do not attempt to fix this again.

---

## Magisk Modules (Post-Flash)

### Recommended stack

| Module | Purpose | Priority |
|---|---|---|
| PerfMTK v11.1 | MTK-specific CPU/GPU/PPM tuning with per-app profiles | High |
| LMKD PSI | Advanced RAM management | High |
| Zram/Swap Manager | Zram configuration | Medium |
| Thermal-Mod | Relaxes conservative MTK thermal limits | Medium |

### PerfMTK vs Encore Tweaks

These modules are **incompatible** — both write to the same kernel sysfs nodes.
Use **PerfMTK** for this device because:
- Has native PPM (Power Policy Manager) support specific to MediaTek
- Per-app profiles via `app_profiles.conf`
- Correct cpuset for G85 topology (policy0=efficiency, policy4=performance)

Configure `app_profiles.conf` for heavy apps:
```
DEFAULT_PROFILE=balanced
com.google.android.youtube=performance
com.brave.browser=balanced
```

### LMKD PSI config for 4GB RAM

Key settings for `config.yaml`:
```yaml
config_version: 1.4
dynamic_swappiness:
  enable: true
  threshold_type: "psi"
  swappiness_range:
    max: 100  # Reduced — 140 is aggressive to eMMC, degrades lifespan
    min: 60   # Higher than the default — with 4GB of RAM it's advisable to compress beforehand
  threshold_psi:
    mode: "auto"
    levels: 6
    auto_cpu:
      max: 60   # More sensitive — the MediaTek Helio G85 doesn't have much CPU headroom
      min: 0
      time_window: "avg10"  # More responsive than avg60 for gaming/active use
    auto_memory:
      max: 15   # More aggressive — with 4GB of RAM you have to react sooner
      min: 0
      time_window: "avg10"
    auto_io:
      max: 20   # eMMC is slow, reacting earlier to I/O pressure
      min: 0
      time_window: "avg10"
    cpu_pressure: [[5, 90], [10, 80], [20, 70], [60, 60], [100, 60]]
    memory_pressure: [[3, 100], [8, 90], [12, 80], [18, 60], [22, 60]]
    # More aggressive in memory — reacts faster with 4GB of RAM
    io_pressure: [[8, 90], [12, 80], [20, 70], [25, 60]]
  threshold_mem_pressure: [[65, 100], [55, 80], [45, 60]]
  # Activate swap beforehand — with 4GB of RAM you can't wait until you're at 40%.

virtual_memory:
  enable: true
  pressure_binding: false
  deactivate_in_sleep: true
  wait_timeout: 300  # 5 min instead of 10 — releases ZRAM faster while sleeping
  zram:
    activation_threshold: 70   # Activate ZRAM earlier (stock was 80)
    deactivation_threshold: 40 # Lower — keep ZRAM active longer
  swap:
    activation_threshold: 80   # Before the 90 default
    deactivation_threshold: 30
```

---

## Kernel Build

Source: https://github.com/nazabe/kernel-mtk (fork of MotorolaMobilityLLC/kernel-mtk)
Branch: `android-14-release-uhas34.29`
Build script reference: `MMI-UHAS34.29-3.txt`

### Build environment setup

```bash
mkdir -p ~/penangf-kernel
cd ~/penangf-kernel

# Toolchain
mkdir -p prebuilts/clang/host
cd prebuilts/clang/host
git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 \
    -b aml_tz3_314012010 --depth=1
cd ~/penangf-kernel/prebuilts
git clone https://android.googlesource.com/kernel/prebuilts/build-tools --depth=1

# Kernel
cd ~/penangf-kernel/kernel-5.10
git clone https://github.com/nazabe/kernel-mtk.git --depth=1 -b android-14-release-uhas34.29
mv kernel-mtk/* . && rm -rf kernel-mtk

# MTK modules (bt/mt66xx module is broken — skip it)
# See MMI-UHAS34.29-3.txt for full module list
```

### Build output

- Kernel image: `out/target/product/penangf/obj/KERNEL_OBJ/kernel-5.10/arch/arm64/boot/Image.gz`
- Flash via: replace `boot.img` only — does not touch logical partitions

### Python note

`scripts/gen_build_config.py` is Python 2. Run with `python2` or install python2:
```bash
sudo apt install python2
```

---

## Known Issues and Limitations

| Issue | Status | Notes |
|---|---|---|
| Navbar gesture gap (38px) | Won't fix | Hardcoded in Android 14 |
| Android 15 upgrade | Not possible | Requires Motorola MTK blobs for A15 |
| Security patches | Not feasible | Requires full Motorola build tree |
| RAM base below 1.2GB | Not achievable | MTK proprietary blobs have fixed overhead |
| BT kernel module | Skip for now | vendor-mediatek-kernel_modules-connectivity-bt-mt66xx is broken |
| MicroG | Pending | Awaiting NanoDroid extraction approach |
| Lockscreen font | Working via Magisk | Native integration via product_a/fonts/ path |

---

## Lessons Learned

### ROM modification

- Always verify `lpmake` partition sizes exactly — wrong sizes cause mount failures
- `vendor_a.img` needs resize before adding binaries (use `resize2fs`)
- SELinux contexts must be set correctly — use `setfattr -n security.selinux`
- File ownership must be `root:root` (0:0) for system files
- File permissions: `0644` for regular files, `0755` for binaries

### Dex/smali

- smali 3.0.9 cannot reassemble full Android 14 dex files — use `--classes` flag to target only what you need
- Always use `-a 28` with smali to produce dex version `039` compatible with this firmware
- Verify dex version with `xxd file.dex | head -1` — must show `dex.039`
- Strip Hidden API annotations (`blacklist`, `greylist-max-o`, etc.) from both fields AND methods
- Never replace framework.jar with a partially assembled version — it WILL bootloop

### Bootloop causes encountered in this project

- Removing `SetupWizard` from system_ext_a
- Removing `MotoCamera` from system_a
- RRO overlay with `navigation_bar_height=0dip`
- `pm.dexopt.first-boot=speed-profile` (use `verify` instead)
- Replacing `framework.jar` with smali-reassembled version missing 4 of 5 dex files
- Replacing `framework.jar` with dex version `040` instead of `039`

### LineageOS 21 test results (for reference)

Tested on penangf — results were worse than this ROM:
- RAM base: 2.1GB (vs ~1.6GB stock-based)
- Gesture navigation: broken
- Hardware compatibility: incomplete MTK driver integration
- Conclusion: stock-based ROM wins on this device

---

## Tools Required

```bash
# System
sudo apt install android-tools-adb android-tools-fastboot \
    e2fsprogs attr zip unzip python3 python3-pip \
    git bc bison flex libssl-dev libelf-dev

# Python packages
pip install androguard lpdump --break-system-packages

# Java tools (download manually)
# baksmali-3.0.9-fat-release.jar → ~/Downloads/
# smali-3.0.9-fat-release.jar → ~/Downloads/

# lpmake — not in apt, obtain from platform-tools or build from AOSP
# lpdump — available at /usr/local/bin/lpdump
```

---

## File Hashes (firmware UHAS34.29-29)

| File | MD5 |
|---|---|
| framework.jar (original) | 22b3453d41dfd6dce14c4c8c91ddd6df |
| classes.dex (original) | 99cdebfc00132b7ddcf67939b563cb57 |
| services.jar | 5fe503d965805b4f16ccc1841a699e22 |
| services.vdex | cebb8750ef8ef6fddef7d19ead96e890 |
| org.spoofing.apk | 992a34d85e2b4649b78761b15c9b631e |

---

## Pending Tasks

- [ ] **MicroG native installation** (next priority) — via NanoDroid extraction approach
- [ ] Enable `GmsCore` and `Phonesky` removal once MicroG is confirmed
- [ ] Add pending bloatware entries listed above
- [ ] Install and configure PerfMTK + LMKD PSI via Magisk post-flash
- [ ] Test SIM functionality to decide on GsmSimProcessor removal
- [ ] ReVanced (YouTube, Spotify) — after MicroG confirmed working
- [ ] Cromite WebView as system WebView replacement
- [ ] Hosts file for system-level ad blocking
- [ ] Kernel custom build with BORE scheduler and BBR2
- [ ] Test `AndroidSystemIntelligence` with `remove:false` — suspected fix for Material You color picker