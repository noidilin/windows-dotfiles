# Ref: https://github.com/KevinNitroG/windows-dotfiles/blob/main/dot_install/prerequisiteScoop.ps1

Write-Host "starting init.ps1 script..."

$SCOOP_INIT = @(
  "versions/firefox-developer"
  "main/chezmoi"
  "main/pwsh"
)

Write-Host "seting up execution policy for scoop..."
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Write-Host "installing execution policy for scoop..."
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# NOTE: fix error. git need to be installed before adding bucket
Write-Host "installing git..."
scoop install git

Write-Host "adding scoop bucket..."
scoop bucket add extras
scoop bucket add versions
scoop bucket add nerd-fonts
scoop bucket add neorocks-scoop https://github.com/nvim-neorocks/rocks-scoop.git

Write-Host "installing initial apps..."
scoop install @SCOOP_INIT

# NOTE: recently added, not tested yet!
Write-Host "running post-install script for scoop..."
reg import "$env:USERPROFILE\scoop\apps\pwsh\current\install-explorer-context.reg"
reg import "$env:USERPROFILE\scoop\apps\pwsh\current\install-file-context.reg"
