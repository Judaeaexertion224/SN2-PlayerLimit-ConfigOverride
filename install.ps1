$ErrorActionPreference = "Stop"

$targetDir = Join-Path $env:LOCALAPPDATA "Subnautica2\Saved\Config\Windows"
$targetFile = Join-Path $targetDir "Game.ini"
$sourceFile = Join-Path $PSScriptRoot "Config\Game.ini"
$backupFile = Join-Path $targetDir ("Game.ini.backup-" + (Get-Date -Format "yyyyMMdd-HHmmss"))

if (-not (Test-Path -LiteralPath $sourceFile)) {
    throw "Missing source config: $sourceFile"
}

New-Item -ItemType Directory -Path $targetDir -Force | Out-Null

if (Test-Path -LiteralPath $targetFile) {
    Copy-Item -LiteralPath $targetFile -Destination $backupFile -Force
    Write-Host "Backed up existing Game.ini to:"
    Write-Host "  $backupFile"
}

Copy-Item -LiteralPath $sourceFile -Destination $targetFile -Force

Write-Host "Installed player-limit config to:"
Write-Host "  $targetFile"
Write-Host ""
Write-Host "Start Subnautica 2 and create a new multiplayer session to test it."
Write-Host "If the game ignores the value, the limit is enforced by packaged assets, executable code, or the online service."

