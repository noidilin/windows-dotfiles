# Ref: https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7
# kevin nitroG: https://github.com/KevinNitroG/windows-dotfiles/blob/main/dot_install/install.ps1

Write-Host "(script) please run this with NON-admin privileges!"
Pause

Write-Host "(script) install prequisite scoop..."
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/init.ps1" | Invoke-Expression

Write-Host "(script) apply chezmoi dotfiles..."
chezmoi init --apply --verbose git@github.com:noidilin/windows-dotfiles.git

Write-Host "(script) install programming languages with scoop..."
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/languages.ps1" | Invoke-Expression

Write-Host "(script) install apps with scoop..."
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/scoop.ps1" | Invoke-Expression

Write-Host "(script) install apps with winget..."
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/winget.ps1" | Invoke-Expression

Write-Host "(script) install npm packages..."
Invoke-WebRequest "https://raw.githubusercontent.com/noidilin/windows-dotfiles/main/dot_install/npm.ps1" | Invoke-Expression

if (Get-Command -Name bat -ErrorAction SilentlyContinue)
{
  Write-Host "(script) build bat themes..."
  bat cache --build
} else
{
  Write-Host "(script) bat not installed, skip building Bat themes!"
}
