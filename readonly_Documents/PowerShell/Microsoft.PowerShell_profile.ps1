$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"
$env:BAT_CONFIG_PATH = "$env:USERPROFILE\.config\bat\config"
$env:FZF_CTRL_T_OPTS = '--preview "bat --color=always --line-range=:500 {}"'
$env:GOPATH = "$env:USERPROFILE\go"

New-Alias -Name gst -Value Get-GitStatus
Set-Alias -Name ls -Value eza
New-Alias -Name ll -Value invoke-eza-all
Set-Alias -Name lg -Value lazygit
Set-Alias -Name y -Value yazi

function Get-GitStatus
{
  & git status $args
}

function eza
{
  eza.exe --icons always --group-directories-first $args
}

function invoke-eza-all
{
  eza.exe -a --icons always --group-directories-first $args
}

function touch
{
  param (
    [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
    [string[]]$paths
  )

  foreach ($path in $paths)
  {
    $directory = [System.IO.Path]::GetDirectoryName($path)

    if (-not [string]::IsNullOrEmpty($directory) -and -not (Test-Path $directory))
    {
      # Create the directory if it doesn't exist
      New-Item -ItemType Directory -Path $directory -Force
    }

    if (Test-Path $path)
    {
      # Update the last write time to the current time
      (Get-Item $path).LastWriteTime = Get-Date
    } else
    {
      # Create an empty file
      New-Item -ItemType File -Path $path
    }
  }
}

# Change directory to folder when 'q', leave as is with 'Q'
function y
{
  $tmp = (New-TemporaryFile).FullName
  yazi.exe $args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp -Encoding UTF8
  if ($cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container))
  {
    Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
  }
  Remove-Item -Path $tmp
}

# Tab completions for Chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
  Import-Module "$ChocolateyProfile"
}

# Tab completions for eza
. $env:USERPROFILE\Documents\PowerShell\_eza.ps1

# Init prompt theme
oh-my-posh init pwsh --config "~/.tangtheme.omp.json" | Invoke-Expression

# Swap PSReadLine colors for user prompt input
Set-PSReadLineOption -Colors @{
  "Comment"="`e[93m"
  "Command"="`e[92m"
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'

# Display fastfetch info on new instances
fastfetch

# Initiate zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
