# Ref: https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7
# kevin nitroG: https://github.com/KevinNitroG/windows-dotfiles/blob/main/dot_install/install.ps1

Write-Host "(batch) please run this with NON-admin privileges!" -ForegroundColor DarkYellow
Pause

Write-Host "(batch) install prequisite scoop..." -ForegroundColor DarkYellow
# . "$HOME/.install/init.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/init.ps1" | Invoke-Expression

Write-Host "(batch) setup environment variable..." -ForegroundColor DarkYellow
# . "$HOME/.install/env.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/env.ps1" | Invoke-Expression

Write-Host "(batch) apply chezmoi dotfiles..." -ForegroundColor DarkYellow
chezmoi init --apply --verbose git@github.com:noidilin/windows-dotfiles.git

Write-Host "(batch) setting up symbolic link..." -ForegroundColor DarkYellow
# . "$HOME/.install/symlinks.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/symlinks.ps1" | Invoke-Expression

Write-Host "(batch) install programming languages with scoop..." -ForegroundColor DarkYellow
# . "$HOME/.install/languages.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/languages.ps1" | Invoke-Expression

# ISSUE: luarocks will popup UAC prompt
Write-Host "(batch) install apps with scoop..." -ForegroundColor DarkYellow
# . "$HOME/.install/scoop.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/scoop.ps1" | Invoke-Expression

Write-Host "(batch) install npm packages..." -ForegroundColor DarkYellow
# . "$HOME/.install/npm.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/npm.ps1" | Invoke-Expression

# ISSUE: can't skip UAC prompt
Write-Host "(batch) install apps with winget..." -ForegroundColor DarkYellow
# . "$HOME/.install/winget.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/winget.ps1" | Invoke-Expression

Write-Host "(batch) batch script finished." -ForegroundColor DarkGreen
