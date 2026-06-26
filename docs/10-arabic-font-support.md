# 10. Arabic Font Support

## Goal

Add Arabic font support to WPS Office PC inside Huawei PC Software Engine.

This allows Arabic documents to render properly and exposes fonts such as `Traditional Arabic` in WPS Office PC.

## Fonts Used

From Windows:

```text
trado.ttf
tradbdo.ttf
arabtype.ttf
```

Font names:

```text
Traditional Arabic
Traditional Arabic Bold
Arabic Typesetting
```

## Target Location

The fonts are installed into the Huawei PC Engine rootfs:

```text
/data/isula/root-fs/usr/share/fonts/custom_arabic
```

This is inside the PC-style runtime used by WPS Office PC, not normal Android `/system/fonts`.

## Why APatch Module Is Used

Directly writing to `/data/isula/root-fs` can be blocked by HarmonyOS permissions and SELinux behavior.

The APatch module handles:

- live policy workaround,
- creating the custom font directory,
- copying Arabic fonts into the HSL rootfs,
- making the fix persistent after reboot.

## Install Arabic Font Support

Install the same module used for WPS English:

```text
wps_hsl_english_arabic_fonts_apatch_module_v1.4.zip
```

Install:

```powershell
.\adb.exe push "wps_hsl_english_arabic_fonts_apatch_module_v1.4.zip" /sdcard/Download/
.\adb.exe shell su -c "/data/adb/ap/bin/apd module install /sdcard/Download/wps_hsl_english_arabic_fonts_apatch_module_v1.4.zip"
.\adb.exe reboot
```

## Verify Fonts

After reboot:

```powershell
.\adb.exe shell su -c "ls -lh /data/isula/root-fs/usr/share/fonts/custom_arabic"
```

Expected files:

```text
arabtype.ttf
tradbdo.ttf
trado.ttf
```

Optional hash check:

```powershell
.\adb.exe shell su -c "sha256sum /data/isula/root-fs/usr/share/fonts/custom_arabic/*.ttf"
```

## Verify in WPS Office PC

Open WPS Office PC and check the font dropdown.

Expected:

```text
Traditional Arabic
Arabic Typesetting
```

Open or type Arabic text. It should render correctly, not as boxes or broken glyphs.

## Notes

This adds Arabic font support. It does not translate the WPS Office PC interface to Arabic.

The interface language fix in this module targets English.

