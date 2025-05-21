Write-Host "starting pnpm.ps1 script..." -ForegroundColor White

$PNPM_PACKAGES = @(
  "@vscode/vsce"
  "tldr"
  "rimraf"
  # "yo"
  # "generator-code"
)

# Write-Host "initializing pnpm env variable..." -ForegroundColor Gray
# ISSUE: might need to restart device in order to add package globally
pnpm setup

Write-Host "installing global pnpm packages..." -ForegroundColor Gray
pnpm add @PNPM_PACKAGES -g

Write-Host "pnpm.ps1 script finished." -ForegroundColor Green
