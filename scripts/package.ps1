$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$distDir = Join-Path $projectRoot 'dist'
$archivePath = Join-Path $distDir 'chzzk-log-power-helper-1.3.2.zip'

New-Item -ItemType Directory -Path $distDir -Force | Out-Null
if (Test-Path -LiteralPath $archivePath) {
    Remove-Item -LiteralPath $archivePath
}

$files = @(
    'manifest.json',
    'content.js',
    'popup.js',
    'log.js',
    'index.html',
    'log.html',
    'icon.png',
    'LICENSE',
    'PRIVACY.md'
) | ForEach-Object { Join-Path $projectRoot $_ }

Compress-Archive -LiteralPath $files -DestinationPath $archivePath -CompressionLevel Optimal
Write-Output $archivePath
