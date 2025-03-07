Write-Host "starting pnpm.ps1 script..."

$PNPM_PACKAGES = @(
  "vsce"
  "yo"
  "generator-code"
  "tldr"
  "rimraf"
)

Write-Host "initializing pnpm env variable..."
pnpm setup
Write-Host "installing global pnpm packages..."
pnpm add @PNPM_PACKAGES -g

Write-Host "pnpm.ps1 script finished." -ForegroundColor DarkGreen
