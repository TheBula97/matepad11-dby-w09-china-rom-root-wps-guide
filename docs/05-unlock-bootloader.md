# 05. Unlock Bootloader

## Goal

Unlock the bootloader on DBY-W09 while the tablet is still on a firmware state that allows the workflow.

## Critical Timing

Do the bootloader unlock before upgrading to HarmonyOS 4.2.

Known usable firmware states:

- HarmonyOS 2.x
- HarmonyOS 3.0.0.312, or the last HarmonyOS 3 rollback build offered by HiSuite

Do not update to HarmonyOS 4.2 first.

## Tool Used

Bootloader unlock was done using Huawei Bootloader Tool v2 from XDA:

https://xdaforums.com/t/bootloader-unlock-tool-permenant-bootloader-unlock-for-some-new-huawei-phones-tablets-with-snapdragon-socs-updated.4780724/

Local project folder used during this workflow:

```text
D:\HUAWEI MATEPAD 11 2021\01_FOLDERS\04_HUAWEI_BOOTLOADER_TOOL_V2
```

Credit goes to the original XDA developer/thread author.

## Before Unlock

Confirm:

```text
[ ] Device is DBY-W09
[ ] Firmware is HOS 2.x or compatible HOS 3 rollback build
[ ] ADB works
[ ] Fastboot works
[ ] EDL works
[ ] Full backup exists
[ ] Original OEMINFO backup exists
[ ] Battery is charged
```

## Basic Fastboot Check

```powershell
.\adb.exe reboot bootloader
.\fastboot.exe devices
```

Expected:

```text
XXXXXXXXXXXX    fastboot
```

## Unlock Flow

1. Prepare/downgrade the tablet to the compatible firmware state.
2. Confirm ADB/Fastboot/EDL.
3. Run Huawei Bootloader Tool v2 from XDA.
4. Follow the tool instructions.
5. Let the tablet complete the unlock process.
6. Reboot.
7. Verify bootloader unlocked state.

## Verify Unlock

Possible checks:

```powershell
.\adb.exe reboot bootloader
.\fastboot.exe devices
.\fastboot.exe oem get-bootinfo
```

Depending on ABL/fastboot behavior, exact output may vary.

Other signs:

- bootloader warning screen,
- Android Utility shows unlocked state,
- fastboot allows flashing previously blocked partitions.

## After Unlock

Do not immediately OTA/HiSuite upgrade to HarmonyOS 4.2.

Next step is to preserve EDL access by flashing the EDL-friendly ABL.

