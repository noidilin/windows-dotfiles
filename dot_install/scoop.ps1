Write-Host "starting scoop.ps1 script..." -ForegroundColor White

$SCOOP_BASE = @(
  "main/7zip"
  "main/gzip"
  "main/unrar"
  "main/wget"
  "main/openssh"
  "neorocks-scoop/luarocks" # For nvim lazy, rest.nvim
)

$SCOOP_LANGUAGES = @(
  "main/mingw"
  "main/mise"
  # "main/rustup-gnu"
)

$SCOOP_FONT = @(
  "nerd-fonts/CommitMono-NF-Mono"
  "nerd-fonts/jf-open-huninn"
  "nerd-fonts/GlowSansTC-Compressed"
  "nerd-fonts/GlowSansTC-Condensed"
  "nerd-fonts/GlowSansTC-Extended"
  "nerd-fonts/GlowSansTC-Normal"
  "nerd-fonts/GlowSansTC-Wide"
)

$SCOOP_GUI = @(
  "extras/via"
  "extras/flow-launcher"
  "extras/vscode"
  "extras/zed"
  "extras/wezterm"
  "extras/blender-launcher"
  "extras/crystaldiskinfo"
  "extras/rufus"
  "extras/sharex"
  "extras/obs-studio"
  "extras/obsidian"
  "extras/potplayer"
  # "main/spicetify-cli"
  # "extras/spicetify-themes"
  # "extra/spotify"
)

$SCOOP_CLI = @(
  "extras/carapace-bin"
  "extras/lazygit"
  "extras/opencode"
  "extras/psreadline"
  "extras/posh-git"
  "extras/psfzf"
  "extras/sfsu"
  "extras/vcredist2022"
  # "main/lazydocker"
  "main/ast-grep"
  "main/bat"
  "main/bottom"
  "main/delta"
  "main/eza"
  "main/fastfetch"
  "main/fd"
  "main/ffmpeg"
  "main/fzf"
  # "main/gh"
  "main/grep"
  "main/gsudo"
  "main/imagemagick"
  "main/less"
  "main/neovim"
  "main/ripgrep"
  "main/sd"
  "main/starship"
  "main/yazi"
  "main/zoxide"
  # "main/jq"
  # "extra/jqp"
  # "main/sed"
  # "main/glow"
  # "main/unar"
  # "main/xh"
  # "main/yq"
  # "main/actionlint"
  # "main/gnupg"
  # "main/yt-dlp"
  # "main/rclone"
  # "main/vivetool"
  # "main/wakatime-cli"
  # "main/goodbyedpi"
)

<#
$SCOOP_OTHERS = @(
  # "extras/putty"
  # "extras/qbittorrent-enhanced"
  # "main/uutils-coreutils"
  # "extras/v2rayn"
  # "extras/winscp"
  # "nonportable/winfsp-np"
  # "main/openssl"
)
#>

Write-Host "installing basic apps with scoop..." -ForegroundColor Gray
scoop install $SCOOP_BASE
Write-Host "basic apps installation finished." -ForegroundColor White

Write-Host "installing programming languages with scoop..." -ForegroundColor Gray
scoop install $SCOOP_LANGUAGES
Write-Host "installing programming languages with mise..." -ForegroundColor Gray
mise install
Write-Host "programming languages installation finished." -ForegroundColor White

Write-Host "installing the rest of scoop apps..." -ForegroundColor Gray
scoop install $SCOOP_FONT
scoop install $SCOOP_GUI
scoop install $SCOOP_CLI
# FIX: can't add blank array to installation list
# scoop install $SCOOP_OTHERS

# NOTE: recently added, not tested yet
if (Get-Command -Name bat -ErrorAction SilentlyContinue) {
  Write-Host "building bat themes..." -ForegroundColor DarkGreen
  bat cache --build
} else {
  Write-Host "bat not installed, skip building Bat themes!" -ForegroundColor DarkGray
}

# allow long path: fix potential problem (suggestion from `scoop checkup`)
gsudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

Write-Host "scoop.ps1 script finished." -ForegroundColor Green
