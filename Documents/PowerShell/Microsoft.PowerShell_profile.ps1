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
Import-Module PSReadLine # Better auto-completion
Import-Module posh-git 

# PSStyle
# ref: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_ansi_terminals?view=powershell-7.4#psstyle
# ANSI color: https://duffney.io/usingansiescapesequencespowershell/#basic-foreground--background-colors
<# $PSStyle.Formatting.ErrorAccent = $PSStyle.Foreground.BrightCyan
$PSStyle.Formatting.Error = $PSStyle.Foreground.BrightRed
$PSStyle.Formatting.Warning = $PSStyle.Foreground.BrightYellow
$PSStyle.Formatting.Verbose = $PSStyle.Foreground.BrightYellow
$PSStyle.Formatting.Debug = $PSStyle.Foreground.BrightYellow #>
$PSStyle.Formatting.FormatAccent = $PSStyle.Foreground.BrightWhite # bright-green
$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.BrightBlack # bright-green
 
# PSReadLine config
. "$env:USERPROFILE/Documents/PowerShell/Scripts/PSReadLine.ps1"
# fzf config
. "$env:USERPROFILE/Documents/PowerShell/Scripts/Fzf.ps1"
# eza config
. "$env:USERPROFILE/Documents/PowerShell/Scripts/eza.ps1"
# command: clean (Delete recycle bin, temp, cache, disk cleanup)
. "$env:USERPROFILE/Documents/PowerShell/Scripts/clean.ps1"
# command: yazi
. "$env:USERPROFILE/Documents/PowerShell/Scripts/yazi.ps1"
# command: replace mocha color palette with color-fatigue
. "$env:USERPROFILE/Documents/PowerShell/Scripts/color-fatigue.ps1"
# command: generate stylus userstyle
. "$env:USERPROFILE/Documents/PowerShell/Scripts/stylus.ps1"

Set-Alias -Name c -Value cls

function Reload-Profile
{
  . $PROFILE
}
Set-Alias -Name rl -Value Reload-Profile

if (Get-Command lazygit)
{
  Set-Alias -Name lg -Value lazygit 
}

Invoke-Expression (&starship init powershell) # starship
Invoke-Expression (& { (zoxide init powershell | Out-String) }) # zoxide

# fastfetch
