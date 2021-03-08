<#
.SYNOPSIS
    New-StreamClipSnapshot creates a file with the current time, so a streamer can go back later and use it as a bookmark for clips.

.EXAMPLE
    New-StreamClipSnapshot -Filename 

.DESCRIPTION
    With no arguments, creates a .json file with the current date and adds the time the script runs.

.PARAMETER DefinedFilename
    Name of the file to write to. If left as $null, write to file with current date as name.

.PARAMETER StartTime
    Start time of the stream. Use $date = Get-Date -Format "HH:mm:ss" and then pass $date as the parameter here.
#>

function New-StreamClipSnapshot {
    param (
        [PARAMETER(Mandatory=$false)]
        [string] $DefinedFilename,

        [PARAMETER(Mandatory=$false)]
        [Object] $StartTime
    )
    $fileName = if ($DefinedFilename) {$DefinedFilename} else {Get-Date -Format "yyyy-MM-dd"}
    $fileName+= ".txt"
    $currentTime = Get-Date -Format "HH:mm:ss"
    if($startTime) {
        $timeSpan = New-TimeSpan -Start $StartTime -End $currentTime
        $currentTime = "$('{0:d2}' -f [int]$timeSpan.TotalHours):$('{0:d2}' -f [int]$timeSpan.TotalMinutes):$('{0:d2}' -f [int]$timeSpan.TotalSeconds)"
    }
    if(Test-Path $fileName) {Add-Content -Path $fileName -Value $currentTime} else {Add-Content -Path $fileName -Value $currentTime}
}