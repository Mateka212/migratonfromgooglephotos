$baseDir = "H:\Google Photos\takeout-20250822T055917Z-1-002\Takeout"
$extensions = "*.heic","*.jpg","*.jpeg","*.png","*.mp4","*.mov","*.avi"

$totalFiles = 0
$updatedFiles = 0
$deletedJson = 0
$logFile = "$baseDir\migration_log.txt"
if (Test-Path $logFile) { Remove-Item $logFile }

Get-ChildItem -Path $baseDir -Recurse -Include $extensions | ForEach-Object {
    $totalFiles++
    $file = $_.FullName
    $jsonFile = "$file.supplemental-metadata.json"

    $date = & "C:\Tools\exiftool.exe" -s -s -s -DateTimeOriginal -CreateDate -ModifyDate -TrackCreateDate -MediaCreateDate "$file"

    if ([string]::IsNullOrWhiteSpace($date)) {
        if (Test-Path $jsonFile) {
            try {
                $json = Get-Content $jsonFile | ConvertFrom-Json
                $timestamp = $json.photoTakenTime.timestamp
                $dt = Get-Date -Date ([System.DateTimeOffset]::FromUnixTimeSeconds($timestamp).DateTime) -Format "yyyy:MM:dd HH:mm:ss"

                & "C:\Tools\exiftool.exe" -overwrite_original `
                    -DateTimeOriginal="$dt" `
                    -CreateDate="$dt" `
                    -ModifyDate="$dt" `
                    -TrackCreateDate="$dt" `
                    -MediaCreateDate="$dt" "$file"

                $updatedFiles++
                Remove-Item $jsonFile -Force
                $deletedJson++

                $logEntry = "Updated date from JSON: $file | Set date: $dt"
                Write-Host $logEntry
                $logEntry | Out-File -Append $logFile
            } catch {
                $err = "Error reading JSON: $jsonFile"
                Write-Host $err
                $err | Out-File -Append $logFile
            }
        } else {
            $msg = "No date and no JSON: $file"
            Write-Host $msg
            $msg | Out-File -Append $logFile
        }
    } else {
        if (Test-Path $jsonFile) {
            Remove-Item $jsonFile -Force
            $deletedJson++
            $msg = "File has date, JSON removed: $file | Current dates: $date"
            Write-Host $msg
            $msg | Out-File -Append $logFile
        }
    }
}

Write-Host "---- Summary ----"
$summary = @(
    "Total files checked: $totalFiles",
    "Dates updated: $updatedFiles",
    "JSON files deleted: $deletedJson"
)
$summary | ForEach-Object { Write-Host $_; $_ | Out-File -Append $logFile }
