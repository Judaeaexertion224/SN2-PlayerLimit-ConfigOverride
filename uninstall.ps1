$ErrorActionPreference = "Stop"

$targetDir = Join-Path $env:LOCALAPPDATA "Subnautica2\Saved\Config\Windows"
$targetFile = Join-Path $targetDir "Game.ini"

if (Test-Path -LiteralPath $targetFile) {
    Remove-Item -LiteralPath $targetFile -Force
    Write-Host "Removed:"
    Write-Host "  $targetFile"
} else {
    Write-Host "No Game.ini override was found at:"
    Write-Host "  $targetFile"
}

Write-Host ""
Write-Host "If an installer backup exists in the same folder, you can restore it manually."

