# oh-my-posh setup
# oh-my-posh init pwsh --config ~/scutum.omp.json | Invoke-Expression

# ref: https://github.com/KevinNitroG/windows-dotfiles/tree/main/Documents/PowerShell

# VARIABLES
$env:EDITOR = "nvim"
# $env:VISUAL = "code"
$env:PAGER = "delta"

Import-Module posh-git 
Import-Module PSReadLine # Better auto-completion
# support plugin suggestion: switch between Inline/List views, by pressing F2
Import-Module CompletionPredictor
Import-Module -Name Microsoft.WinGet.CommandNotFound

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
# Eza config
. "$env:USERPROFILE/Documents/PowerShell/Scripts/eza.ps1"
# fzf config
. "$env:USERPROFILE/Documents/PowerShell/Scripts/Fzf.ps1"
# Clean (Delete recycle bin, temp, cache, disk cleanup)
. "$env:USERPROFILE/Documents/PowerShell/Scripts/clean.ps1"
# generate stylus userstyle
# . "$env:USERPROFILE/Documents/PowerShell/Scripts/stylus.ps1"

Invoke-Expression (&starship init powershell) # starship
Invoke-Expression (& { (zoxide init powershell | Out-String) }) # zoxide