# 04. Rebrand to China ROM

## Goal

Convert/rebrand the tablet from its original region state to DBY-W09 ALL/CN so it can accept China firmware and WPS Office PC ecosystem features.

## Before You Start

You must already have:

- confirmed the tablet is DBY-W09,
- working ADB/Fastboot,
- working EDL/9008,
- a full EDL backup,
- original OEMINFO backup,
- GPT backup,
- the converted DBY-W09 ALL/CN OEMINFO file.

Do not continue without the original OEMINFO backup.

## Concept

Huawei firmware eligibility depends heavily on model and region data.

For this workflow, the target identity is:

```text
Model: DBY-W09
Region: ALL/CN
Cust: C00
```

The converted OEMINFO is used to make the tablet match the China firmware track.

## Files Used

Typical rebrand files:

```text
converted_oeminfo.img
update_sd_base.zip
update_sd_cust_DBY-W09_all_cn.zip
update_sd_preload_DBY-W09_all_cn_R5.zip
```

The DLOAD folder should look like:

```text
dload/
  update_sd_base.zip
  update_sd_cust_DBY-W09_all_cn.zip
  update_sd_preload_DBY-W09_all_cn_R5.zip
```

## Step 1: Backup Original OEMINFO

Before flashing converted OEMINFO, save the original one.

Minimum:

```text
oeminfo_original.img
```

Recommended:

```text
backup/original_oeminfo/oeminfo_original.img
```

## Step 2: Flash Converted OEMINFO

Flash the converted OEMINFO only after EDL read/write has been verified and backups exist.

Target file:

```text
converted_oeminfo.img
```

Expected identity after conversion:

```text
DBY-W09
ALL/CN
C00
```

## Step 3: DLOAD China Package

Prepare a USB flash drive or OTG storage.

Folder name must be:

```text
dload
```

Then enter Huawei recovery/update menu and choose:

```text
Memory card/OTG update mode
```

Expected behavior:

```text
Verifying package
Installing update
Rebooting
```

## If DLOAD Fails

Common error:

```text
Software install failed
Failed to check the update package
Please download the package again
```

Check:

- folder name is exactly `dload`,
- all required ZIP files are inside `dload`,
- file names are not changed,
- package is for DBY-W09 ALL/CN,
- USB drive is readable by the tablet,
- package was fully copied and safely ejected,
- files are not corrupted.

## Step 4: Verify Region

After boot:

```powershell
.\adb.exe shell getprop ro.product.model
.\adb.exe shell getprop ro.product.locale.region
.\adb.exe shell getprop ro.build.display.id
```

Expected:

```text
DBY-W09
CN
C00 / China build information
```

## Important

This step prepares the tablet for the China ROM path. It does not replace the need for bootloader unlock or EDL preservation.

Keep the original OEMINFO backup forever.

