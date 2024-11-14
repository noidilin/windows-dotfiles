# Ref: https://github.com/KevinNitroG/windows-dotfiles/blob/main/dot_install/prerequisiteScoop.ps1

Write-Host "starting init.ps1 script..."

$SCOOP_INIT = @(
  "versions/firefox-developer"
  "main/git"
  "main/chezmoi"
  "main/pwsh"
)

Write-Host "seting up execution policy for scoop..."
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Write-Host "installing execution policy for scoop..."
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

Write-Host "adding scoop bucket..."
scoop bucket add main
scoop bucket add extras
scoop bucket add versions
scoop bucket add nerd-fonts
scoop bucket add neorocks-scoop https://github.com/nvim-neorocks/rocks-scoop.git

# scoop bucket add nonportable
# scoop bucket add sysinternals

Write-Host "installing initial apps..."
scoop install @SCOOP_INIT
