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

# APEX packages — cannot be deleted, replaced with empty stub instead
# APEX_BLOATWARE+=($(jq -r '.system_a_apex[] | select(.remove == true) | "system_a/\(.path)"' "$CONFIG"))

# if [ ${#APEX_BLOATWARE[@]} -gt 0 ]; then
#     echo ""
#     echo "[⚙️] Processing APEX packages..."
#     for apex_path in "${APEX_BLOATWARE[@]}"; do
#         TARGET="${BASE_DIR}/${apex_path}"
#         # APEX packages can appear as a directory or as a .apex file
#         if [ -d "$TARGET" ]; then
#             echo "[-] Stubbing APEX directory: ${TARGET}"
#             sudo rm -rf "$TARGET"
#             sudo mkdir -p "$TARGET"
#         elif [ -f "${TARGET}.apex" ]; then
#             echo "[-] Stubbing APEX file: ${TARGET}.apex"
#             sudo truncate -s 0 "${TARGET}.apex"
#         elif [ -f "${TARGET}" ]; then
#             echo "[-] Stubbing APEX file: ${TARGET}"
#             sudo truncate -s 0 "${TARGET}"
#         else
#             echo "[?] APEX not found (skipping): ${TARGET}"
#         fi
#     done
# fi

# NOTE: This is the list of all the apps on the device

# ls unpacked/mnt/product_a/app 
# CalculatorGoogle  com.google.android.modulemetadata  DeskClockGoogle  LatinImeGoogle  NonFrameworkLbs  TrichromeLibrary  WebViewGoogle

# ls unpacked/mnt/product_a/priv-app
# CarrierSettings  ConfigUpdater  CrossDeviceServices  GmsCore  GoogleCarrierWifi  GoogleDialer  ImsServiceEntitlement  Phonesky  SettingsIntelligence  Wellbeing

# ls unpacked/mnt/system_a/system/app
# BluetoothMidiService   CaptivePortalLoginGoogle  CertInstaller    HTMLViewer  MtkPrivacyPolicy  PrintSpooler
# CameraExtensionsProxy  CarrierDefaultApp         GoogleExtShared  KeyChain    PacProcessor      SecureElement

# ls unpacked/mnt/system_a/system/priv-app
# BackupRestoreConfirmation  DownloadProvider                  InputDevices         MotoLauncher                              MtkTelecom            SharedStorageBackup
# BlockedNumberProvider      DownloadProviderUi                IntentResolver       MotorolaSettingsProviderExternalPrebuilt  MtkTelephonyProvider  Shell
# BuiltInPrintService        DynamicSystemInstallationService  LocalTransport       MtkCalendarProvider                       MtkTeleService        UserDictionaryProvider
# CallLogBackup              ExternalStorageProvider           MediaProviderLegacy  MtkContactsProvider                       MtpService            VpnDialogs
# CredentialManager          FusedLocation                     Messages             MtkMmsService                             NetworkStackGoogle
# DocumentsUIGoogle          GooglePackageInstaller            MotoCamera           MtkPowerTouch                             ProxyHandler

# ls unpacked/mnt/system_ext_a/app
# mediatek-res  TeeService

# ls unpacked/mnt/system_ext_a/priv-app
# CarrierConfig     GmsSimProcessor          ImsService   ModemStatsService  MtkGbaService  MtkSettingsProvider  MtkTelephonyAssist
# DeviceManagement  GoogleServicesFramework  LPPeService  MtkCapCtrl         MtkSettings    MtkSystemUI          StorageManager