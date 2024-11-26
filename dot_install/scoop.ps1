Write-Host "starting scoop.ps1 script..." -ForegroundColor DarkGreen

$SCOOP_BASE = @(
  "main/7zip"
  "main/gzip"
  "main/unrar"
  "main/wget"
  "main/openssh"
  "neorocks-scoop/luarocks" # For nvim lazy, rest.nvim
  "nerd-fonts/CommitMono-NF-Mono"
  # "extras/winrar"
)

$SCOOP_GUI = @(
  "extras/via"
  "extras/flow-launcher"
  "extras/everything"
  "extras/vscode"
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
  # "extras/dockercompletion"
  # "extras/scoop-completion"
  "extras/carapace-bin"
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
  "main/grep"
  "main/ripgrep"
  "main/ast-grep"
  "main/zoxide"
  "main/ffmpeg"
  "main/imagemagick"
  "main/jq"
  "main/yazi"
  # "main/sd"
  # "main/sed"
  # "main/touch"
  # "main/sudo"
  # "main/gsudo"
  # "main/gh"
  # "main/glow"
  # "extra/jqp"
  # "main/unar"
  # "main/xh"
  # "main/yq"
  # "main/actionlint"
  # "main/gpg" # Use default builtin gpg of git
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

Write-Host "installing scoop apps..." -ForegroundColor DarkGreen
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
  Write-Host "bat not installed, skip building Bat themes!" -ForegroundColor DarkRed
}

Write-Host "scoop.ps1 script finished." -ForegroundColor DarkGreen
