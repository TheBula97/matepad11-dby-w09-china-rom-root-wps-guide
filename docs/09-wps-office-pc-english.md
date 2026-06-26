# 09. WPS Office PC English

## Goal

Install WPS Office PC on HarmonyOS China ROM and force the interface to English.

## Important Concept

WPS Office PC on this tablet is not the same as normal WPS Android.

It runs through Huawei PC Software Engine / HSL:

```text
HarmonyOS
  -> Huawei PC Software Engine / HSL
  -> PC-style WPS Office runtime
  -> WPS Office PC
```

Because of that, changing Android system language may not be enough. The WPS PC language is controlled by the Huawei PC Engine/HSL runtime and WPS MUI resources.

## Install WPS Office PC

On China ROM:

1. Open AppGallery.
2. Change AppGallery region to China if WPS Office PC is not available.
3. Install Huawei PC Software Engine if prompted.
4. Install WPS Office PC.
5. Launch WPS Office PC once.

At this stage, the interface may still be Chinese.

## What Was Patched

The working patch targets two main areas:

1. HSL/container environment language.
2. WPS MUI resource mapping.

Original HSL language:

```text
LANGUAGE=zh_CN
```

Patched language:

```text
LANGUAGE=en_US.UTF-8
```

WPS MUI path:

```text
/data/isula/root-fs/opt/kingsoft/wps-office/office6/mui
```

The `zh_CN` MUI path is redirected to `en_US` when needed.

## APatch Module

The persistent fix is packaged as an APatch module:

```text
wps_hsl_english_arabic_fonts_apatch_module_v1.4.zip
```

Module ID:

```text
wps_hsl_english
```

Module version:

```text
1.4
```

## Install Module

Push the module:

```powershell
.\adb.exe push "wps_hsl_english_arabic_fonts_apatch_module_v1.4.zip" /sdcard/Download/
```

Install with APatch CLI:

```powershell
.\adb.exe shell su -c "/data/adb/ap/bin/apd module install /sdcard/Download/wps_hsl_english_arabic_fonts_apatch_module_v1.4.zip"
```

Reboot:

```powershell
.\adb.exe reboot
```

## Verify Module

```powershell
.\adb.exe shell su -c "/data/adb/ap/bin/apd module list"
```

Expected:

```text
id: wps_hsl_english
enabled: true
version: 1.4
```

## Verify WPS UI

Open WPS Office PC.

Expected UI labels include:

- Home
- Insert
- Page Layout
- References
- Review
- View
- Special Features

If the login window appears in Chinese but the main UI is English, close the login window and verify the actual WPS editor UI.

## If WPS Returns to Chinese

Try:

```powershell
.\adb.exe shell su -c "am force-stop com.huawei.hsl"
.\adb.exe shell su -c 'for name in wpsoffice wpscloudsvr weston-rdprail-shell weston-keyboard weston HSLGd; do for pid in $(pidof "$name" 2>/dev/null); do kill -9 "$pid"; done; done'
```

Then open WPS again.

If it still returns to Chinese:

1. Confirm APatch root works.
2. Confirm module is enabled.
3. Reinstall module v1.4.
4. Reboot.
