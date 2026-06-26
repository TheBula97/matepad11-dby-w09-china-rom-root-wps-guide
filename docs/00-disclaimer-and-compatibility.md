# 00. Disclaimer and Compatibility

## Goal

This chapter defines the supported device, tested firmware path, and the main safety rules before any modification is attempted.

## Supported Device

| Item | Supported Value |
|---|---|
| Device | Huawei MatePad 11 2021 |
| Model | DBY-W09 |
| Chipset | Qualcomm Snapdragon 865 |
| Storage target | UFS/eMMC layout handled through EDL tooling |
| Target region | ALL/CN, C00 |
| Target firmware | HarmonyOS 4.2 China |

Do not use this guide on other models unless you have verified partition layout, firmware packages, firehose/programmer compatibility, and bootloader behavior yourself.

## Tested End State

The tested final setup was:

- HarmonyOS 4.2 China ROM
- bootloader unlocked
- EDL access preserved through fastboot
- APatch root
- WPS Office PC in English
- Traditional Arabic and Arabic Typesetting fonts available inside WPS Office PC

## Main Risk

This process can cause:

- data loss,
- bootloop,
- failed boot,
- loss of EDL access,
- broken fastboot behavior,
- region mismatch,
- device brick.

Proceed only if you understand the risk.

## EDL Is the Main Road

In this workflow, EDL is not optional. It is the main working and recovery path.

EDL access allows you to:

- detect the tablet in Qualcomm 9008 mode,
- make a full backup,
- backup GPT, ABL, OEMINFO, and other critical partitions,
- restore important partitions if something breaks,
- recover from some failed flash or bootloop situations.

First rule:

```text
Do not continue unless EDL access is confirmed and a full backup has been made.
```

Hard stop conditions:

```text
No EDL access = stop.
No full backup = stop.
Wrong model = stop.
Wrong firmware package = stop.
```

## Bootloader Unlock Compatibility Note

Based on this workflow, bootloader unlock and EDL preparation should be done on firmware that still allows the required low-level path.

Known usable firmware states:

- HarmonyOS 2.x
- HarmonyOS 3.0.0.312, or the last HarmonyOS 3 rollback build offered by HiSuite

In this case, HiSuite only offered rollback/downgrade up to HarmonyOS 3.0.0.312. That build was still usable for the workflow.

HarmonyOS 4.2 is more restricted. Do not update to HarmonyOS 4.2 first if you still need to unlock bootloader or preserve EDL access.

## OTA and HiSuite Upgrade Warning

After unlocking the bootloader and flashing the EDL-friendly ABL, do not upgrade to HarmonyOS 4.2 through:

- System OTA updater
- HiSuite update/upgrade

Both methods may overwrite or reset ABL behavior and remove the preserved fastboot-to-EDL path.

Use HiSuite only for rollback/downgrade when needed. Use manual PC flashing for the HarmonyOS 4.2 upgrade in this workflow.

## Recommended Upgrade Path

```text
Compatible HOS 2.x / HOS 3.0.0.312
  -> Confirm EDL
  -> Full backup
  -> Unlock bootloader
  -> Flash EDL-friendly ABL
  -> Manual PC flash to HOS 4.2
  -> Verify fastboot-to-EDL access
  -> Root
```

Avoid:

```text
Unlock bootloader
  -> OTA or HiSuite upgrade to HOS 4.2
  -> ABL behavior may be reset
  -> fastboot-to-EDL access may be lost
```

