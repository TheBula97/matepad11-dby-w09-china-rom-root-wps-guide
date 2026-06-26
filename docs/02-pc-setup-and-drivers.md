# 02. PC Setup and Drivers

## Goal

Set up Windows so the tablet can be detected in ADB, Fastboot, and EDL/9008 mode.

## Install Platform Tools

Extract Android Platform Tools and open PowerShell inside the `platform-tools` folder.

PowerShell does not run executables from the current folder automatically. Use:

```powershell
.\adb.exe
.\fastboot.exe
```

not:

```powershell
adb
fastboot
```

## Check ADB

Enable USB debugging on the tablet, then run:

```powershell
.\adb.exe devices -l
```

Expected:

```text
List of devices attached
XXXXXXXXXXXX    device product:DBY-W09 model:DBY_W09 ...
```

If unauthorized, check the tablet screen and approve the USB debugging prompt.

## Check Fastboot

Reboot to bootloader:

```powershell
.\adb.exe reboot bootloader
```

Check fastboot:

```powershell
.\fastboot.exe devices
```

Expected:

```text
XXXXXXXXXXXX    fastboot
```

## Install Huawei Drivers

Install HiSuite to get Huawei USB/HDB driver support.

HiSuite can be useful for rollback/downgrade, but do not use it to upgrade to HarmonyOS 4.2 in this workflow.

## Install Qualcomm 9008 Driver

Install Qualcomm QDLoader driver.

For Windows 11, if the driver cannot load:

1. Open Windows Security.
2. Go to Device security.
3. Open Core isolation.
4. Turn off Memory Integrity.
5. Reboot Windows.
6. Reinstall the Qualcomm driver.

Expected EDL device name:

```text
Qualcomm HS-USB QDLoader 9008
```

## Zadig / WinUSB Note

If the device appears as `QUSB_BULK` instead of QDLoader, Zadig can be used to bind WinUSB to the correct `QUSB_BULK` device.

Be careful not to select unrelated devices such as:

- touchpad,
- camera,
- Bluetooth,
- USB flash drive.

The target should look similar to:

```text
QUSB_BULK_CID:0412_SN:...
USB ID: 05C6:9008
```

## Quick Driver Checklist

```text
[ ] adb devices works
[ ] fastboot devices works
[ ] EDL/9008 detected in Device Manager
[ ] Qualcomm driver loads without security warning
[ ] Memory Integrity issue resolved if needed
```

