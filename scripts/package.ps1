$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$distDir = Join-Path $projectRoot 'dist'
$archivePath = Join-Path $distDir 'AMO-UPLOAD-chzzk-log-power-helper-1.3.2.zip'

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

Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [System.IO.Compression.ZipFile]::OpenRead($archivePath)
try {
    $entryNames = @($archive.Entries | ForEach-Object { $_.FullName })
    if ($entryNames -notcontains 'manifest.json') {
        throw 'Invalid AMO package: manifest.json is not at the ZIP root.'
    }

    if ($entryNames | Where-Object { $_ -match '^[^/]+/manifest\.json$' }) {
        throw 'Invalid AMO package: a containing directory was included in the ZIP.'
    }
}
finally {
    $archive.Dispose()
}

Write-Output 'AMO package verified: manifest.json is at the ZIP root.'
Write-Output $archivePath
