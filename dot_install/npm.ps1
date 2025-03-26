Write-Host "starting npm.ps1 script..." -ForegroundColor White

$NPM_PACKAGES = @(
  "@vscode/vsce"
  # "yo"
  # "generator-code"
  "tldr"
  "rimraf"
)

Write-Host "installing global npm packages..." -ForegroundColor Gray
npm install @NPM_PACKAGES -g

Write-Host "npm.ps1 script finished." -ForegroundColor Green
