# 06. Preserve EDL Access on HarmonyOS 4.2

## Goal

Keep EDL access available even after updating to HarmonyOS 4.2.

This is one of the most important parts of the workflow.

## Why This Matters

HarmonyOS 4.2 is more restricted. A stock HarmonyOS 4.2 setup may block normal EDL reboot access.

The workaround used here is:

```text
Unlock bootloader first
  -> Flash EDL-friendly ABL
  -> Manually flash HarmonyOS 4.2 from PC
  -> Enter EDL through fastboot when needed
```

## File Used

```text
abl_hw865870unlock.elf
```

This ABL was flashed before upgrading to HarmonyOS 4.2.

## Flash EDL-Friendly ABL

From the platform-tools folder:

```powershell
.\adb.exe reboot bootloader
.\fastboot.exe devices
.\fastboot.exe flash abl "<project-files>\abl_hw865870unlock.elf"
.\fastboot.exe reboot
```

Expected:

```text
Sending 'abl' OKAY
Writing 'abl' OKAY
Finished
```

## Enter EDL After HarmonyOS 4.2

After the EDL-friendly ABL is flashed and the tablet is on HOS 4.2, EDL can still be accessed through fastboot.

Example:

```powershell
.\adb.exe reboot bootloader
.\fastboot.exe devices
.\fastboot.exe oem edl
```

If supported by the current fastboot/ABL behavior, another possible command is:

```powershell
.\fastboot.exe reboot-edl
```

Expected Windows Device Manager result:

```text
Qualcomm HS-USB QDLoader 9008
```

## Do Not Upgrade with OTA or HiSuite

After flashing the EDL-friendly ABL, do not upgrade to HarmonyOS 4.2 using:

- System OTA updater
- HiSuite update/upgrade

Both methods may reset/overwrite ABL behavior and remove the preserved EDL command/path.

Use manual PC flashing instead.

## Correct Path

```text
Unlocked bootloader
  -> Flash EDL-friendly ABL
  -> Manual PC flash HOS 4.2
  -> Fastboot-to-EDL preserved
```

## Wrong Path

```text
Unlocked bootloader
  -> OTA/HiSuite update to HOS 4.2
  -> ABL behavior may reset
  -> EDL access may be lost
```
