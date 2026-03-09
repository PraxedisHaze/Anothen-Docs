$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$book = Split-Path -Parent $root

$mdFiles = Get-ChildItem -Recurse -File $book | Where-Object { $_.Extension -eq ".md" }

$broken = @()
foreach ($f in $mdFiles) {
    $content = Get-Content -Raw $f.FullName
    $matches = [regex]::Matches($content, '\[[^\]]+\]\(([^)]+)\)')
    foreach ($m in $matches) {
        $target = $m.Groups[1].Value
        if ($target -match '^(https?://|mailto:|#)') { continue }
        $resolved = [System.IO.Path]::GetFullPath((Join-Path $f.DirectoryName $target))
        if (-not (Test-Path $resolved)) {
            $broken += [pscustomobject]@{
                File = $f.FullName
                Link = $target
                Resolved = $resolved
            }
        }
    }
}

if ($broken.Count -eq 0) {
    Write-Output "OK: No broken local markdown links in P&P_BOOK."
    exit 0
}

Write-Output "BROKEN LINKS:"
$broken | Format-Table -AutoSize
exit 1

