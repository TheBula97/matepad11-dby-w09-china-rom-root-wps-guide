# 07. Flash HarmonyOS 4.2 China ROM

## Goal

Manually flash HarmonyOS 4.2 China ROM while keeping the bootloader unlocked and preserving fastboot-to-EDL access.

## Important

Do not use OTA or HiSuite to upgrade to HarmonyOS 4.2 in this workflow.

Use PC flashing.

## Required Firmware Packages

```text
update_full_base.zip
update_full_cust_DBY-W09_all_cn.zip
update_full_preload_DBY-W09_all_cn_R1.zip
```

All three packages must match:

```text
DBY-W09
ALL/CN
C00
```

## Tool Used

Android Utility Pro was used to load and flash the Huawei firmware packages.

## Before Flash

Confirm:

```text
[ ] Device is DBY-W09
[ ] Region has been prepared for ALL/CN
[ ] Bootloader is unlocked
[ ] EDL-friendly ABL has already been flashed
[ ] Full backup exists
[ ] HOS 4.2 firmware package set is complete
[ ] Battery is charged
```

## Android Utility Loading Order

In the Huawei tab, load:

```text
HUAWEI UPDATE BASE    -> update_full_base.zip
HUAWEI UPDATE CUST    -> update_full_cust_DBY-W09_all_cn.zip
HUAWEI UPDATE PRELOAD -> update_full_preload_DBY-W09_all_cn_R1.zip
```

The tool should parse:

- base package info,
- cust package info,
- preload package info,
- partition list.

## Flash Mode

Use the fastboot firmware update path.

Recommended options used in this workflow:

```text
FW Update (FB)
Skip (OEM/NV)
Auto Reboot optional
```

`Skip (OEM/NV)` is important to avoid overwriting device-specific NV/OEM data unnecessarily.

## Common Error

If Android Utility shows:

```text
FAILED (remote: 'Command not allowed')
```

Possible causes:

- bootloader is still locked,
- fastboot flashing is blocked,
- wrong mode,
- ABL/firmware state does not allow the command.

Do not keep pressing buttons blindly. Re-check bootloader state.

## After Flash

The first boot can take time.

Expected:

- HarmonyOS boot animation,
- app optimization,
- setup screen,
- China ROM features available.

## Verify

After setup and ADB authorization:

```powershell
.\adb.exe shell getprop ro.product.model
.\adb.exe shell getprop ro.build.version.incremental
.\adb.exe shell getprop ro.product.locale.region
.\adb.exe shell getprop ro.build.display.id
```

Expected:

```text
DBY-W09
CN
HarmonyOS 4.2 build information
```

## Verify EDL Still Works

After HOS 4.2 boot:

```powershell
.\adb.exe reboot bootloader
.\fastboot.exe devices
.\fastboot.exe oem edl
```

Expected in Windows Device Manager:

```text
Qualcomm HS-USB QDLoader 9008
```

If this works, the EDL-friendly ABL path was preserved.

