Write-Host "starting languages.ps1 script..."

$SCOOP_LANGUAGES = @(
  "main/mingw"
  "main/rustup-gnu"
  "main/nodejs-lts"
  "main/bun"
  "main/python"
  # "main/docker"
  # "main/docker-compose"
)

Write-Host "installing programming languages with scoop..."
scoop install $SCOOP_LANGUAGES

Write-Host "languages.ps1 script finished." -ForegroundColor DarkGreen
