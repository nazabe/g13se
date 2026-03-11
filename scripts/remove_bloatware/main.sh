#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[x] Incorrect arguments!"
    echo "     Using: $0 <BASE_DIR>"
    exit 1
fi

BASE_DIR=$1
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
CONFIG="${SCRIPT_DIR}/bloatware.json"
BLOATWARE=()
APEX_BLOATWARE=()

# NOTE: Mount system partitions
# sudo mount -t ext4 -o loop unpacked/system_a.img unpacked/mnt/system_a
# sudo mount -t ext4 -o loop unpacked/product_a.img unpacked/mnt/product_a
# sudo mount -t ext4 -o loop unpacked/system_ext_a.img unpacked/mnt/system_ext_a

# NOTE: Unount system partitions
# sudo umount unpacked/mnt/system_a unpacked/mnt/product_a unpacked/mnt/system_ext_a

# NOTE: Remove MotoCamera & CalculatorGoogle from bloatware.json.

# TODO: Add Youtube ReVanced, MicroG.

# Standard partitions — simple rm -rf
BLOATWARE+=($(jq -r '.product_a[] | select(.remove == true) | "product_a/\(.path)"' "$CONFIG"))
BLOATWARE+=($(jq -r '.system_a[] | select(.remove == true) | "system_a/\(.path)"' "$CONFIG"))
BLOATWARE+=($(jq -r '.system_ext_a[] | select(.remove == true) | "system_ext_a/\(.path)"' "$CONFIG"))

for package in "${BLOATWARE[@]}"; do
    TARGET="${BASE_DIR}/${package}"
    if [ -e "$TARGET" ]; then
        # echo "[-] ${TARGET}"
        sudo rm -rf "$TARGET"
    else
        echo "[?] Not found (skipping): ${TARGET}"
    fi
done

# NOTE: This is the list of all the apps on the device

# ls unpacked/mnt/product_a/app/ && ls unpacked/mnt/product_a/priv-app/

# CalculatorGoogle  com.google.android.modulemetadata  DeskClockGoogle  Magisk-v30.7  NonFrameworkLbs  OpenBoard-v1.4.5  QKSMS-v3.10.1  TrichromeLibrary  WebViewGoogle
# CarrierSettings  ConfigUpdater  CrossDeviceServices  GmsCore  GoogleCarrierWifi  GoogleDialer  ImsServiceEntitlement  Phonesky  SettingsIntelligence  Wellbeing

# ls unpacked/mnt/system_a/system/app/ && ls unpacked/mnt/system_a/system/priv-app/

# BluetoothMidiService   CaptivePortalLoginGoogle  CertInstaller    HTMLViewer  MtkPrivacyPolicy  PrintSpooler
# CameraExtensionsProxy  CarrierDefaultApp         GoogleExtShared  KeyChain    PacProcessor      SecureElement
# BackupRestoreConfirmation  DownloadProvider                  InputDevices         MotorolaSettingsProviderExternalPrebuilt  MtkTelephonyProvider  Shell
# BlockedNumberProvider      DownloadProviderUi                IntentResolver       MtkCalendarProvider                       MtkTeleService        ThemeStub
# BuiltInPrintService        DynamicSystemInstallationService  LocalTransport       MtkContactsProvider                       MtpService            UserDictionaryProvider
# CallLogBackup              ExternalStorageProvider           MediaProviderLegacy  MtkMmsService                             NetworkStackGoogle    VpnDialogs
# CredentialManager          FusedLocation                     MotoCamera           MtkPowerTouch                             ProxyHandler          Wallpaper
# DocumentsUIGoogle          GooglePackageInstaller            MotoLauncher         MtkTelecom                                SharedStorageBackup

# ls unpacked/mnt/system_ext_a/app/ && ls unpacked/mnt/system_ext_a/priv-app/

# mediatek-res  TeeService
# CarrierConfig     GmsSimProcessor          ImsService   ModemStatsService  MtkGbaService  MtkSettingsProvider  MtkTelephonyAssist  StorageManager
# DeviceManagement  GoogleServicesFramework  LPPeService  MtkCapCtrl         MtkSettings    MtkSystemUI          SetupWizard         WallpaperCropper