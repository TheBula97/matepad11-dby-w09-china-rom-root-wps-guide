param(
  [string]$PlatformTools = "."
)

$adb = Join-Path $PlatformTools "adb.exe"

if (-not (Test-Path -LiteralPath $adb)) {
  Write-Error "adb.exe not found in $PlatformTools"
  exit 1
}

& $adb devices -l

