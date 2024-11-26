$env:EDITOR = "nvim"
$env:VISUAL = "code"
$env:PAGER = "delta"

$env:CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense" # optional
$env:ANTHROPIC_API_KEY = "$HOME\.config\api\ANTHROPIC_API_KEY"

Import-Module posh-git 
Import-Module PSReadLine

. "$HOME\.config\pwsh\scripts\PSReadLine.ps1"
. "$HOME\.config\pwsh\scripts\fzf.ps1"
. "$HOME\.config\pwsh\scripts\eza.ps1"
. "$HOME\.config\pwsh\scripts\commands.ps1"

if (Get-Command "starship" -ErrorAction SilentlyContinue) {
  Invoke-Expression (& starship init powershell)
}

if (Get-Command "zoxide" -ErrorAction SilentlyContinue) {
  Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

if (Get-Command "chezmoi" -ErrorAction SilentlyContinue) {
  Invoke-Expression (& { (chezmoi completion powershell | Out-String) })
}

if (Get-Command "carapace" -ErrorAction SilentlyContinue) {
  Invoke-Expression (& { (carapace _carapace | Out-String) })
}

# fastfetch
