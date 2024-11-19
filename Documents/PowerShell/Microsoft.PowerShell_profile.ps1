$env:EDITOR = "nvim"
$env:VISUAL = "code"
$env:PAGER = "delta"

# $env:USERPROFILE = $HOME
$env:XDG_CONFIG_HOME = "$env:USERPROFILE\.config" # config files (write)
$env:XDG_DATA_HOME = "$env:USERPROFILE\.local\share" # user data (write)
$env:XDG_CACHE_HOME = "$env:USERPROFILE\.cache" # non-essential data (read/write)
$env:YAZI_FILE_ONE = "$env:USERPROFILE\scoop\apps\git\current\usr\bin\file.exe" # preview feature
$env:YAZI_CONFIG_HOME = "$env:USERPROFILE\.config\yazi" # preview feature
$env:EZA_CONFIG_DIR = "$env:USERPROFILE\.config\eza" # eza theme
$env:BAT_CONFIG_DIR = "$env:USERPROFILE\.config\bat" # bat config

Import-Module CompletionPredictor
Import-Module PSReadLine
Import-Module posh-git 

# source other profile scripts
. "$env:USERPROFILE\Documents\PowerShell\Scripts\PSReadLine.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Scripts\Fzf.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Scripts\eza.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Scripts\commands.ps1"

if (Get-Command "starship" -ErrorAction SilentlyContinue) {
  Invoke-Expression (& starship init powershell)
}

if (Get-Command "zoxide" -ErrorAction SilentlyContinue) {
  Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

if (Get-Command "chezmoi" -ErrorAction SilentlyContinue) {
  Invoke-Expression (& { (chezmoi completion powershell | Out-String) })
}

# fastfetch
