param(
  [string]$PlatformTools = "."
)

$fastboot = Join-Path $PlatformTools "fastboot.exe"

if (-not (Test-Path -LiteralPath $fastboot)) {
  Write-Error "fastboot.exe not found in $PlatformTools"
  exit 1
}

& $fastboot devices

