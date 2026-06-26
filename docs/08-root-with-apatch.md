# 08. Root with APatch

## Goal

Root the DBY-W09 using APatch after HarmonyOS 4.2 China ROM is installed.

## Required Files

```text
APatch APK
patched boot image
```

Example files used in the local project:

```text
01_APatch_11142_166daa0_on_HEAD-release-signed.apk
apatch_patched_11142_0.12.2_cvjb.img
```

## Important

The patched boot image must match the firmware/build it was created from.

Do not flash a patched boot image from another build unless you are prepared to recover.

## Install APatch

```powershell
.\adb.exe install "D:\HUAWEI MATEPAD 11 2021\01_FOLDERS\01_WORK_READY\05_ROOT_OPTIONAL\01_APatch_11142_166daa0_on_HEAD-release-signed.apk"
```

Open APatch on the tablet and set/save the SuperKey.

## Flash Patched Boot

Reboot to bootloader:

```powershell
.\adb.exe reboot bootloader
.\fastboot.exe devices
```

Flash patched boot:

```powershell
.\fastboot.exe flash boot "D:\HUAWEI MATEPAD 11 2021\01_FOLDERS\01_WORK_READY\05_ROOT_OPTIONAL\03_APatch_patched_boot\apatch_patched_11142_0.12.2_cvjb.img"
.\fastboot.exe reboot
```

## Verify Root

After boot and USB debugging authorization:

```powershell
.\adb.exe shell su -c id
```

Expected:

```text
uid=0(root) gid=0(root)
```

Check APatch module CLI:

```powershell
.\adb.exe shell su -c "/data/adb/ap/bin/apd module list"
```

## SELinux

The device may remain:

```text
Enforcing
```

That is normal. The WPS module includes policy handling for its own HSL/rootfs patching needs.

## If Boot Fails

If the tablet bootloops after flashing patched boot:

1. Return to fastboot if possible.
2. Flash the original boot image from the same firmware.
3. If fastboot is not enough, use EDL recovery path.

This is why EDL access and full backup are mandatory.

