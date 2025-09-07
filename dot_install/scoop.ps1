Write-Host "starting scoop.ps1 script..." -ForegroundColor White

$SCOOP_BASE = @(
  "main/7zip"
  "main/gzip"
  "main/unrar"
  "main/wget"
  "main/openssh"
  "neorocks-scoop/luarocks" # For nvim lazy, rest.nvim
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
  "extras/sfsu"
  "extras/opencode"
  "extras/vcredist2022"
  "extras/psreadline"
  "extras/posh-git"
  "extras/psfzf"
  # "main/lazydocker"
  "main/neovim"
  "main/starship"
  "main/fastfetch"
  "main/bottom"
  "main/gsudo"
  "main/eza"
  "main/bat"
  "main/less"
  "main/delta"
  "extras/lazygit"
  "main/fzf"
  "main/fd"
  "main/sd"
  "main/grep"
  "main/ripgrep"
  "main/ast-grep"
  "main/zoxide"
  "main/ffmpeg"
  "main/imagemagick"
  "main/yazi"
  # "main/jq"
  # "extra/jqp"
  # "main/sed"
  # "main/gh"
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
  # "extras/qbittorrent-enhanced"
  # "extras/v2rayn"
  # "extras/winscp"
  # "main/openssl"
  # "main/uutils-coreutils"
  # "nonportable/winfsp-np"
  # "extras/putty"
)
#>

Write-Host "installing scoop apps..." -ForegroundColor Gray
scoop install $SCOOP_BASE
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
