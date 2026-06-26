param(
  [string]$PlatformTools = "."
)

$adb = Join-Path $PlatformTools "adb.exe"

if (-not (Test-Path -LiteralPath $adb)) {
  Write-Error "adb.exe not found in $PlatformTools"
  exit 1
}

& $adb shell su -c id
& $adb shell su -c "/data/adb/ap/bin/apd module list"
