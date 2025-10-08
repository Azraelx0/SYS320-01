. (Join-Path $PSScriptroot ApacheLogs2.ps1)
. (Join-Path $PSScriptRoot ParseApache.ps1)

$results = ApacheLogs -Page "index.html" -HTTPCode "200" -Browser "Chrome"
Write-Host $results
