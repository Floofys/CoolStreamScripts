<#
    Please format your verbose messages as such:
        Write-Verbose "$($MyInvocation.MyCommand.Name): <Message>"

    Which tells the caller exactly which command the message came from
#>

# if debugging, set moduleRoot to current directory
if ($MyInvocation.MyCommand.Path) {
    $moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path
  }else {
    $moduleRoot = $PWD.Path
  }
  
  # Load up the dependent functions
  "$moduleRoot\Public\*" |
    Get-ChildItem -Recurse -Filter *.ps1 |
      Resolve-Path |
        Where-Object { -not ($_.ProviderPath.ToLower().Contains('.tests.')) } |
          ForEach-Object { . $_.ProviderPath }
  
  Export-ModuleMember New-StreamClipSnapshot