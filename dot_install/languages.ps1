Write-Host "starting languages.ps1 script..."

$SCOOP_LANGUAGES = @(
  "main/mingw"
  "main/nodejs"
  "main/python"
  "main/pnpm"
  "main/rustup-gnu"
  # "main/docker"
  # "main/docker-compose"
)

Write-Host "installing programming languages with scoop..."
scoop install $SCOOP_LANGUAGES

Write-Host "languages.ps1 script finished." -ForegroundColor DarkGreen
