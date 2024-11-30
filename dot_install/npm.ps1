Write-Host "starting npm.ps1 script..."

$NPM_PACKAGES = @(
  "vsce"
  "yo"
  "generator-code"
  "tldr"
  "rimraf"
  "prettier"
  "markdownlint-cli2"
  # "eslint"
  # "commitizen"
)

Write-Host "installing global npm packages..."
npm install @NPM_PACKAGES -g

Write-Host "npm.ps1 script finished." -ForegroundColor DarkGreen
