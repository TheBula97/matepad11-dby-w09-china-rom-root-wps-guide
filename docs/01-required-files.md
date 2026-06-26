# 01. Required Files

## Goal

This chapter lists the files used in this workflow and explains what each file is for.

Do not blindly download random files. File/model mismatch is one of the easiest ways to break the tablet.

Throughout this guide, paths such as `<project-files>` mean your own local folder where you keep the downloaded tools, firmware packages, backups, and module files. Replace the placeholder with your actual path.

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
| `converted_oeminfo.img` | OEMINFO converted to DBY-W09 ALL/CN |
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

## Suggested File Manifest Format

For GitHub, include hashes instead of uploading large firmware directly.

```md
| File | SHA256 | Source | Purpose |
|---|---|---|---|
| update_full_base.zip | ... | Huawei CDN / Firmware Finder | HOS 4.2 base |
| update_full_cust_DBY-W09_all_cn.zip | ... | Huawei CDN / Firmware Finder | ALL/CN custom |
| update_full_preload_DBY-W09_all_cn_R1.zip | ... | Huawei CDN / Firmware Finder | ALL/CN preload |
```

## Files Not Recommended to Mirror

Avoid uploading:

- full Huawei firmware packages,
- proprietary paid tools,
- cracked tools,
- files from sources that do not allow redistribution.

It is safer to document filenames, checksums, and source references.
