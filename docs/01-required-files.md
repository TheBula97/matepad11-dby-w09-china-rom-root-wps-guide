# 01. Required Files

## Goal

This chapter lists the files used in this workflow and explains what each file is for.

Do not blindly download random files. File/model mismatch is one of the easiest ways to break the tablet.

Throughout this guide, paths such as `<project-files>` mean your own local folder where you keep the downloaded tools, firmware packages, backups, and module files. Replace the placeholder with your actual path.

## Companion File Package

A Google Drive package is available here:

[DBY-W09 MatePad 11 2021 China ROM Root WPS Package](https://drive.google.com/drive/folders/1WjF99DV-UTEPkM3YRkm77TCNjAOZIpk9?usp=sharing)

Recommended use:

1. Download the full folder.
2. Read `00_READ_FIRST/READ_FIRST.md`.
3. Verify `00_READ_FIRST/CHECKSUMS_SHA256.txt`.
4. Keep the folder layout unchanged.

This package does not include personal device backups such as original OEMINFO, converted OEMINFO, GPT backup, NV/persist partitions, userdata, or full EDL backup.

## PC Tools

| File/Tool | Purpose | Notes |
|---|---|---|
| Android Platform Tools | ADB and Fastboot commands | Use `adb.exe` and `fastboot.exe` from the extracted platform-tools folder |
| Qualcomm QDLoader driver | Detect Qualcomm HS-USB QDLoader 9008 | Required for EDL |
| HiSuite | Huawei driver and rollback helper | Use for rollback/downgrade only, not HOS 4.2 upgrade |
| 7-Zip | Extract archives and firmware packages | Useful for ZIP/7z/APK inspection |
| Android Utility Pro | Manual PC flashing of Huawei update packages | Used for HOS 4.2 package loading/flashing |
| Huawei Bootloader Tool v2 | Bootloader unlock workflow | From XDA |

## Rebrand and EDL Files

| File | Purpose |
|---|---|
| Firehose/programmer file | EDL communication/programming |
| `converted_oeminfo.img` | OEMINFO converted to DBY-W09 ALL/CN; generate this yourself from your own device backup |
| `abl_hw865870unlock.elf` | EDL-friendly/unlocked ABL used to preserve fastboot-to-EDL path |
| GPT backup/reference | Partition recovery/reference |
| Full EDL backup | Safety net before modifying anything |

## DLOAD / China Base Files

Typical DLOAD folder:

```text
dload/
  update_sd_base.zip
  update_sd_cust_DBY-W09_all_cn.zip
  update_sd_preload_DBY-W09_all_cn_R5.zip
```

These were used during the transition/rebrand path when needed.

## HarmonyOS 4.2 China ROM Files

Manual PC flashing package set:

```text
update_full_base.zip
update_full_cust_DBY-W09_all_cn.zip
update_full_preload_DBY-W09_all_cn_R1.zip
```

The `base`, `cust`, and `preload` packages must match the DBY-W09 ALL/CN target.

## Root Files

| File | Purpose |
|---|---|
| APatch APK | Root manager |
| Patched boot image | Boot image patched by APatch |

The patched boot image must match the running firmware/build. Do not flash a patched boot from the wrong build.

## WPS Office PC Files

| File | Purpose |
|---|---|
| Huawei PC Software Engine | Runtime layer for WPS Office PC |
| WPS Office PC | Desktop-style WPS running inside Huawei PC Engine |
| `wps_hsl_english_arabic_fonts_apatch_module_v1.4.zip` | APatch module for English UI + Arabic fonts |

The APatch module handles:

- HSL environment language patch,
- WPS MUI `zh_CN` to `en_US` handling,
- Traditional Arabic font install,
- Arabic Typesetting font install.

## Files Not Recommended to Share Publicly

Avoid uploading:

- original or converted OEMINFO from your own device,
- full EDL backup,
- GPT/NV/persist/userdata/account-related partitions,
- proprietary paid tools,
- cracked tools,
- files from sources that do not allow redistribution.

It is safer to document filenames, checksums, and source references. If you provide a separate Drive package, include checksums and keep personal device dumps private.
