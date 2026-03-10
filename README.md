# Moto G13SE Builder
Custom firmware A14 based on stock without bloatware for penangf Moto G13SE & configuration for LMC8.4 GCAM.

## Features

### ✅ Done
- Removed (almost) all Motorola bloatware, including apps that could not be removed manually.
- Removed pre-installation of all unnecessary Google apps.
- Pre-installed lightweight open-source alternative apps:
  - **OpenBoard** — replaces Gboard
  - **QKSMS** — replaces Google Messages
- Optimized build.prop for Helio G85 with 4GB RAM:
  - Fixed 90Hz refresh rate
  - Optimized Dalvik heap configuration
  - LMKD in PSI mode
  - Optimized network buffers

### 🔄 In progress
- **Native Signature Spoofing** — direct patch on `framework.jar` for full MicroG support without root
- **MicroG** — Google Play Services replacement (~150MB RAM savings estimated)

### 📋 Pending
- Install and test Magisk modules:
  - Encore Tweaks — Helio G85 governor optimization
  - LMKD PSI RAM — advanced memory management
- ReVanced + MicroG once signature spoofing is working
- RRO overlays for additional UI customization
- Replace Android SystemWebView with alternative

## Estimated resource savings vs Stock
| Replacement | RAM saved |
|---|---|
| OpenBoard vs Gboard | ~50-290MB |
| QKSMS vs Google Messages | ~30-80MB |
| MicroG vs GMS (pending) | ~80-150MB |
| Full debloat | ~100-200MB |
| **Total estimated** | **~260-720MB** |

## How to build
- Download your firmware from lolinet: https://mirrors.lolinet.com/firmware/lenomola/2023/penangf/official/
- Install dependencies:
  ```shell
  sudo apt install android-tools-adb android-tools-fastboot adb
  pip install lpdump --break-system-packages
  ```
- Copy `super.img` to the root project directory
- Run the build script:
  ```shell
  ./build.sh super.img
  ```
- Flash using the install script (device in fastboot mode):
  ```shell
  ./install_custom.sh ../path/to/stock/firmware/
  ```

## Technical notes
- Tested firmware: `UHAS34.29-29` — other firmware versions may require regenerating the signature spoofing patch.