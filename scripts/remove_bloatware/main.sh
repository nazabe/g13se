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
        echo "[-] ${TARGET}"
        sudo rm -rf "$TARGET"
    else
        echo "[?] Not found (skipping): ${TARGET}"
    fi
done

# NOTE: This is the list of all the apps on the device

# penangf:/ $ ls product/app/ && ls product/priv-app/                                                                                                                                       

# CalculatorGoogle  DeskClockGoogle  Magisk-v30.7  NonFrameworkLbs  OpenBoard-v1.4.5  QUIK-v4.3.4  TrichromeLibrary  WebViewGoogle  com.google.android.modulemetadata
# CarrierSettings  CrossDeviceServices  GmsCore  GoogleCarrierWifi  GoogleDialer  ImsServiceEntitlement  Phonesky  SettingsIntelligence  Wellbeing

# penangf:/ $ ls system/app/ && ls system/priv-app/                                                                                                                                         

# BluetoothMidiService   CaptivePortalLoginGoogle  CertInstaller    HTMLViewer  MtkPrivacyPolicy  PrintSpooler
# CameraExtensionsProxy  CarrierDefaultApp         GoogleExtShared  KeyChain    PacProcessor      SecureElement
# BackupRestoreConfirmation  DownloadProvider                  InputDevices         MotorolaSettingsProviderExternalPrebuilt  MtkTelecom            Shell
# BlockedNumberProvider      DownloadProviderUi                IntentResolver       MtkCalendarProvider                       MtkTelephonyProvider  ThemeStub
# BuiltInPrintService        DynamicSystemInstallationService  LocalTransport       MtkContactsProvider                       MtpService            UserDictionaryProvider
# CallLogBackup              ExternalStorageProvider           MediaProviderLegacy  MtkMmsService                             NetworkStackGoogle    VpnDialogs
# CredentialManager          FusedLocation                     MotoCamera           MtkPowerTouch                             ProxyHandler          Wallpaper
# DocumentsUIGoogle          GooglePackageInstaller            MotoLauncher         MtkTeleService                            SharedStorageBackup

# penangf:/ $ ls system_ext/app && ls system_ext/priv-app/                                                                                                                                  

# TeeService  mediatek-res
# CarrierConfig     GmsSimProcessor          ImsService   ModemStatsService  MtkGbaService  MtkSettingsProvider  MtkTelephonyAssist  StorageManager
# DeviceManagement  GoogleServicesFramework  LPPeService  MtkCapCtrl         MtkSettings    MtkSystemUI          SetupWizard         WallpaperCropper