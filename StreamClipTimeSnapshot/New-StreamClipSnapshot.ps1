<#
.SYNOPSIS
    New-StreamClipSnapshot creates a file (or adds to a sql database) the current time, so a streamer can go back later and use it as a bookmark for clips.

.EXAMPLE
    New-StreamClipSnapshot -Filename 

.DESCRIPTION
    With no arguments, creates a .json file with the current date and adds the time the script runs.

.PARAMETER DefinedFilename
    Name of the file to write to
#>

function New-StreamClipSnapshot {
    param (
        [PARAMETER(Mandatory=$false)]
        [string] $DefinedFilename
    )

    $fileName = ''
    if($DefinedFilename) {
        $fileName = DefinedFilename
    }
    else
    {
        $fileName = Get-Date -Format "yyyy/MM/dd"
    }

    $currentTime = Get-Date -Format "HH:mm"
    
    
}