# ref: https://github.com/KevinNitroG/windows-dotfiles/tree/main/Documents/PowerShell

# VARIABLES
$env:EDITOR = "nvim"
# $env:VISUAL = "code"
$env:PAGER = "delta"
$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"

# support plugin suggestion: switch between Inline/List views, by pressing F2
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
