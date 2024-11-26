Write-Host "starting init.ps1 script..." -ForegroundColor DarkGreen

$SCOOP_INIT = @(
  "versions/firefox-developer"
  "main/chezmoi"
  "main/pwsh"
  "main/nu"
  "extras/age"
)

Write-Host "seting up execution policy for scoop..." -ForegroundColor DarkGreen
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Write-Host "installing execution policy for scoop..." -ForegroundColor DarkGreen
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# NOTE: fix error. git need to be installed before adding bucket
Write-Host "installing git..." -ForegroundColor DarkGreen
scoop install git

Write-Host "adding scoop bucket..." -ForegroundColor DarkGreen
scoop bucket add extras
scoop bucket add versions
scoop bucket add nerd-fonts
scoop bucket add neorocks-scoop https://github.com/nvim-neorocks/rocks-scoop.git

Write-Host "installing initial apps..." -ForegroundColor DarkGreen
scoop install @SCOOP_INIT

# NOTE: recently added, not tested yet!
Write-Host "running post-install script for scoop..." -ForegroundColor DarkGreen
reg import "$env:USERPROFILE\scoop\apps\pwsh\current\install-explorer-context.reg"
reg import "$env:USERPROFILE\scoop\apps\pwsh\current\install-file-context.reg"

Write-Host "init.ps1 script finished." -ForegroundColor DarkGreen
