Write-Host "starting bun.ps1 script..." -ForegroundColor White

$BUN_PACKAGES = @(
  "@vscode/vsce"
  "tldr"
  "rimraf"
  # "yo"
  # "generator-code"
)

Write-Host "installing global bun packages..." -ForegroundColor Gray
bun install @BUN_PACKAGES -g

Write-Host "bun.ps1 script finished." -ForegroundColor Green
