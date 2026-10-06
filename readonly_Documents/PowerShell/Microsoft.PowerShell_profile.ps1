if (-not [string]::isnullorempty($env:ssh_tty)) {
    return
}

$env:yazi_file_one = "c:\program files\git\usr\bin\file.exe"
$env:bat_config_path = "$env:userprofile\.config\bat\config"
$env:fzf_ctrl_t_opts = '--preview "bat --color=always --line-range=:500 {}"'
$env:gopath = "$env:userprofile\go"
$env:path += ";c:\msys64\mingw64\bin"
$env:herdr_config_path = "$env:userprofile\.config\herdr\config.toml"

new-alias -name gst -value get-gitstatus
set-alias -name ls -value eza
new-alias -name ll -value invoke-eza-all
set-alias -name lg -value lazygit
set-alias -name y -value yazi

set-psreadlinekeyhandler -key "ctrl+u" -function backwarddeleteline
set-psreadlinekeyhandler -key "ctrl+k" -function forwarddeleteline
remove-psreadlinekeyhandler -chord ctrl+spacebar

function lms
{
  llama-server -hf unsloth/qwen3.5-9b-gguf:ud-q4_k_xl --alias "unsloth/qwen3.5" --temp 0.6 --top-p 0.95 --ctx-size 16384 --top-k 20 --min-p 0.00 --port 8001 --chat-template-kwargs '{"enable_thinking":false}'
}

function get-gitstatus
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
    [parameter(mandatory=$true, valuefromremainingarguments=$true)]
    [string[]]$paths
  )

  foreach ($path in $paths)
  {
    $directory = [system.io.path]::getdirectoryname($path)

    if (-not [string]::isnullorempty($directory) -and -not (test-path $directory))
    {
      # create the directory if it doesn't exist
      new-item -itemtype directory -path $directory -force
    }

    if (test-path $path)
    {
      # update the last write time to the current time
      (get-item $path).lastwritetime = get-date
    } else
    {
      # create an empty file
      new-item -itemtype file -path $path
    }
  }
}

# change directory to folder when 'q', leave as is with 'q'
function y
{
  $tmp = (new-temporaryfile).fullname
  yazi.exe $args --cwd-file="$tmp"
  $cwd = get-content -path $tmp -encoding utf8
  if ($cwd -ne $pwd.path -and (test-path -literalpath $cwd -pathtype container))
  {
    set-location -literalpath (resolve-path -literalpath $cwd).path
  }
  remove-item -path $tmp
}

# tab completions for chocolatey
# $chocolateyprofile = "$env:chocolateyinstall\helpers\chocolateyprofile.psm1"
# if (test-path($chocolateyprofile))
# {
#   import-module "$chocolateyprofile"
# }

# Tab completions for eza
. $env:USERPROFILE\Documents\PowerShell\_eza.ps1

# Init prompt theme
oh-my-posh init pwsh --config "~/.tangtheme.omp.json" | Invoke-Expression

# Swap PSReadLine colors for user prompt input
Set-PSReadLineOption -Colors @{
  "Comment"="`e[93m"
  "Command"="`e[92m"
}

# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'

# Display fastfetch info on new instances
# fastfetch

# Initiate zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
(&mise activate pwsh) | Out-String | Invoke-Expression

# Initialize fnm (Fast Node Manager) for PowerShell
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
