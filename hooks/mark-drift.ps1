# Marks drift in project-context/STATUS.md when a cited source is newer than the recorded read.
# Does not write a new snapshot and does not change the state column.
$ErrorActionPreference = "Stop"

function Get-OutputDir {
    param([string]$Root)
    $fallback = "project-context"
    $config = Join-Path $Root ".cursor\adrenaline.json"
    if (-not (Test-Path -LiteralPath $config)) { return $fallback }
    try {
        $json = Get-Content -Raw -LiteralPath $config | ConvertFrom-Json
        $path = [string]$json.outputDirs."plugin-project-context"
        if ([string]::IsNullOrWhiteSpace($path)) { return $fallback }
        $path = $path.Replace("/", "\").Trim("\")
        if ($path -match '(^\.\.)|(\\\.\.\\)|(\.\.$)|(^[A-Za-z]:\\)|(^\\)') { return $fallback }
        return $path
    } catch {
        return $fallback
    }
}

function Get-ProjectRoot {
    $candidates = @()
    foreach ($name in @("CURSOR_PROJECT_DIR", "CLAUDE_PROJECT_DIR")) {
        $value = [Environment]::GetEnvironmentVariable($name)
        if ($value) { $candidates += $value }
    }
    $candidates += (Get-Location).Path
    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath (Join-Path $candidate "project-context\STATUS.md")) { return $candidate }
        if (Test-Path -LiteralPath (Join-Path $candidate ".cursor\adrenaline.json")) { return $candidate }
    }
    return $null
}

try {
    $root = Get-ProjectRoot
    if (-not $root) { exit 0 }

    $folder = Get-OutputDir $root
    $dir = Join-Path $root $folder
    $statusPath = Join-Path $dir "STATUS.md"
    if (-not (Test-Path -LiteralPath $statusPath)) { exit 0 }

    $lines = [System.Collections.Generic.List[string]]@(Get-Content -LiteralPath $statusPath)
    $changed = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($line -notmatch '^\|\s*\d+\s*\|') { continue }
        $cells = $line.Split("|")
        if ($cells.Count -lt 6) { continue }
        $state = $cells[3].Trim()
        $notes = $cells[5].Trim()
        if ($state -ne "accepted") { continue }
        if ($notes -notmatch 'sources:\s*([^;]+)') { continue }
        if ($notes -notmatch 'read:\s*(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z)') { continue }

        $read = [datetime]::Parse($Matches[1]).ToUniversalTime()
        $sourceMatch = [regex]::Match($notes, 'sources:\s*([^;]+)')
        $sources = $sourceMatch.Groups[1].Value.Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ }
        $drift = @()
        foreach ($relative in $sources) {
            if ($relative -match '(^\.\.)|([\\/]\.\.[\\/])|(^[A-Za-z]:)|(project-context[\\/])') { continue }
            $full = Join-Path $root ($relative.Replace("/", "\"))
            if (-not (Test-Path -LiteralPath $full -PathType Leaf)) {
                $drift += $relative
                continue
            }
            $written = (Get-Item -LiteralPath $full).LastWriteTimeUtc
            if ($written -gt $read.AddSeconds(2)) { $drift += $relative }
        }
        if ($drift.Count -eq 0) { continue }

        $existing = @()
        $driftMatch = [regex]::Match($notes, 'drift:\s*([^;]+)')
        if ($driftMatch.Success) {
            $existing = @($driftMatch.Groups[1].Value.Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ })
        }
        $seen = @{}
        foreach ($item in @($existing + @($drift))) {
            if ($item -and -not $seen.ContainsKey($item)) { $seen[$item] = $true }
        }
        $driftText = ($seen.Keys -join ", ")
        if ($driftMatch.Success) {
            $notes = [regex]::Replace($notes, 'drift:\s*[^;]+', "drift: $driftText")
        } else {
            $notes = "$notes; drift: $driftText"
        }
        $cells[5] = " $notes "
        $lines[$i] = ($cells -join "|")
        $changed = $true
    }

    if ($changed) {
        $utf8 = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllLines($statusPath, $lines.ToArray(), $utf8)
    }
    exit 0
} catch {
    exit 0
}
