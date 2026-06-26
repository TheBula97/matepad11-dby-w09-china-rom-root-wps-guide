# 03. EDL Access and Full Backup

## Goal

Confirm EDL access and create a full backup before modifying anything.

This is the most important safety chapter.

## Why EDL Matters

EDL is the main road.

ADB and fastboot are useful, but EDL is the low-level recovery and backup path. Without EDL, a failed flash or wrong OEMINFO can stop the whole workflow.

## Entering EDL

Possible methods depend on current firmware and device state:

- ADB/fastboot command path if still allowed,
- hardware/manual key path if available,
- EDL-friendly ABL path after it has been flashed,
- tools that can trigger EDL on supported firmware.

Expected Windows detection:

```text
Qualcomm HS-USB QDLoader 9008
```

## Read-Only Test First

Before writing anything, perform a read-only EDL test.

The goal is only to verify:

- driver is correct,
- programmer/firehose works,
- the tablet responds,
- GPT/partition data can be read.

Do not start by writing partitions.

## Backup Required Partitions

Minimum required:

- full device backup if possible,
- GPT from all LUNs,
- `abl`,
- `oeminfo`,
- `boot`,
- `vbmeta`,
- modem/NV-related partitions,
- any partition you plan to modify.

Recommended structure:

```text
backup/
  full_backup_after_edl_detect/
    lun0/
    lun1/
    lun2/
    lun3/
    lun4/
    lun5/
  original_oeminfo/
  original_abl/
  gpt/
```

## Verify Backup

After backup:

1. Confirm files exist.
2. Confirm files are not zero bytes.
3. Store a copy somewhere outside the project folder.
4. Do not delete the original backup.

## Stop Conditions

Stop if:

- EDL device is not detected,
- EDL read fails,
- full backup cannot be made,
- GPT cannot be read,
- firehose/programmer is unknown or unverified,
- model is not confirmed as DBY-W09.

## Backup Rule

```text
If you cannot restore, you are not ready to modify.
```

