# 11. Troubleshooting

## General Rule

If something fails, stop and identify which layer failed:

```text
Driver -> ADB -> Fastboot -> EDL -> Firmware -> Bootloader -> Root -> HSL/WPS
```

Do not continue flashing randomly.

## Common Issues

| Problem | Likely Cause | Fix |
|---|---|---|
| `fastboot` not recognized | PowerShell does not run current folder executables by default | Use `.\fastboot.exe` |
| `adb` not recognized | Platform-tools folder not in PATH/current directory | Open PowerShell inside platform-tools or use full path |
| Device unauthorized in ADB | USB debugging prompt not approved | Approve prompt on tablet |
| Qualcomm driver cannot load | Windows Memory Integrity blocks old driver | Disable Memory Integrity, reboot, reinstall driver |
| Device appears as `QUSB_BULK` | Driver not bound correctly | Use correct Qualcomm driver or Zadig WinUSB carefully |
| DLOAD says package check failed | Wrong file/folder/package or OTG storage issue | Recheck `dload` folder, package names, OTG adapter, and USB drive |
| Android Utility `Command not allowed` | Bootloader locked or flashing blocked | Unlock bootloader first |
| HOS 4.2 lost EDL command | OTA/HiSuite may have reset ABL behavior | Restore/flash EDL-friendly ABL if possible |
| APatch says not installed | Patched boot not flashed or wrong boot image | Flash matching patched boot |
| `su -c id` fails | APatch not active/authorized | Open APatch, check SuperKey/root authorization |
| WPS PC still Chinese | HSL session cached or module inactive | Enable/reinstall module, reboot, force-stop HSL |
| `Traditional Arabic` missing | Font injection not active | Reinstall module v1.4 and reboot |

## Fastboot Command Not Found

Wrong:

```powershell
fastboot devices
```

Correct:

```powershell
.\fastboot.exe devices
```

## Driver Cannot Load on Windows

If Windows shows:

```text
A driver cannot load on this device
```

Turn off Memory Integrity:

```text
Windows Security
  -> Device security
  -> Core isolation
  -> Memory Integrity off
  -> Reboot
```

Then reinstall Qualcomm driver.

## DLOAD Failure

Correct structure:

```text
USB drive root/
  dload/
    update_sd_base.zip
    update_sd_cust_DBY-W09_all_cn.zip
    update_sd_preload_DBY-W09_all_cn_R5.zip
```

Avoid:

```text
dload/dload/
renamed ZIP files
missing cust/preload
wrong model package
corrupted copy
USB drive not detected by recovery
non-working OTG adapter
```

For DLOAD, the tablet must read the update package directly from USB-C OTG storage:

```text
Tablet USB-C port
  -> OTG flash drive
```

or:

```text
Tablet USB-C port
  -> USB-C OTG adapter/dongle
  -> USB flash drive
```

A normal USB cable connected to the PC is not the same thing.

## EDL Access Lost

This is why the guide emphasizes EDL as the main road.

If fastboot-to-EDL no longer works after HOS 4.2:

- check whether OTA/HiSuite upgrade was used,
- check whether EDL-friendly ABL was overwritten,
- try fastboot commands supported by the current ABL,
- use hardware/other EDL methods only if you understand the risk,
- restore via known-good backup if EDL is still reachable.

## WPS PC Login Window Is Chinese

The login window can still show Chinese in some states. The important check is the WPS editor UI:

- Home
- Insert
- Page Layout
- Review
- View

If the editor UI is English, the main patch is working.

## WPS PC English Fix Not Persistent

Check module:

```powershell
.\adb.exe shell su -c "/data/adb/ap/bin/apd module list"
```

Expected:

```text
wps_hsl_english
enabled: true
version: 1.4
```

If not:

```powershell
.\adb.exe shell su -c "/data/adb/ap/bin/apd module install /sdcard/Download/wps_hsl_english_arabic_fonts_apatch_module_v1.4.zip"
.\adb.exe reboot
```
