# Ref: https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7
# kevin nitroG: https://github.com/KevinNitroG/windows-dotfiles/blob/main/dot_install/install.ps1

Write-Host "(batch) please run this with NON-admin privileges!"
Pause

Write-Host "(batch) install prequisite scoop..."
# . "$env:USERPROFILE/.install/init.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/init.ps1" | Invoke-Expression

Write-Host "(batch) apply chezmoi dotfiles..."
chezmoi init --apply --verbose git@github.com:noidilin/windows-dotfiles.git

Write-Host "(batch) install programming languages with scoop..."
# . "$env:USERPROFILE/.install/languages.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/languages.ps1" | Invoke-Expression

# FIX: luarocks will popup UAC prompt
Write-Host "(batch) install apps with scoop..."
# . "$env:USERPROFILE/.install/scoop.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/scoop.ps1" | Invoke-Expression

Write-Host "(batch) install npm packages..."
# . "$env:USERPROFILE/.install/npm.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/npm.ps1" | Invoke-Expression

# FIX: can't skip UAC prompt
Write-Host "(batch) install apps with winget..."
# . "$env:USERPROFILE/.install/winget.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/winget.ps1" | Invoke-Expression
