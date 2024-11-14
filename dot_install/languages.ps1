# Ref: https://github.com/KevinNitroG/windows-dotfiles/blob/main/dot_install/programmingLanguage.ps1

Write-Host "starting languages.ps1 script..."

$SCOOP_LANGUAGES = @(
  "main/mingw"
  "main/nodejs"
  "main/python"
  # "main/go"
  # "main/rust"
  # "main/docker"
  # "main/docker-compose"
)

Write-Host "installing programming languages with scoop..."
scoop install $SCOOP_LANGUAGES
