# Ref: https://github.com/KevinNitroG/windows-dotfiles/blob/main/dot_install/softwares-nonadmin.ps1

Write-Host "starting scoop.ps1 script..."

$SCOOP_BASE = @(
  "main/7zip"
  "main/gzip"
  "main/unrar"
  "main/wget"
  "main/openssh"
  "neorocks-scoop/luarocks" # For nvim lazy, rest.nvim
  "nerd-fonts/CommitMono-NF"
  # "extras/winrar"
)

$SCOOP_GUI = @(
  # "extras/unigetui"
  "extras/powertoys"
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
  "extras/scoop-completion"
  "extras/posh-git"
  "extras/psfzf"
  "extras/psreadline"
  # "main/lazydocker"
  "main/neovim"
  "main/starship"
  "main/fastfetch"
  "main/bottom"
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
  # "main/gh"
  # "main/glow"
  # "main/gnupg"
  # "main/goodbyedpi"
  # "extra/jqp"
  # "main/adb"
  # "main/poppler"
  # "main/rclone"
  # "main/sd"
  # "main/sed"
  # "main/sudo"
  # "main/touch"
  # "main/unar"
  # "main/vivetool"
  # "main/wakatime-cli"
  # "main/xh"
  # "main/yq"
  # "main/yt-dlp"
  # "main/actionlint"
  # "main/lf"
  # "main/gpg" # Use default builtin gpg of git
  # "sysinternals/whois"
)

$SCOOP_OTHERS = @(
  # "extras/qbittorrent-enhanced"
  # "extras/v2rayn"
  # "extras/winscp"
  # "main/openssl"
  # "main/uutils-coreutils"
  # "nonportable/winfsp-np"
  # "extras/putty"
)

Write-Host "installing completion predictor through PSGallery..."
Install-Module -Name CompletionPredictor -Repository PSGallery -Force

Write-Host "installing scoop apps..."
scoop install $SCOOP_BASE $SCOOP_GUI $SCOOP_CLI $SCOOP_OTHERS

Write-Host "running post-install script for scoop..."
# Post install script for scoop
# reg import "$env:USERPROFILE\scoop\apps\windows-terminal\current\install-context.reg"
reg import "$env:USERPROFILE\scoop\apps\pwsh\current\install-explorer-context.reg"
reg import "$env:USERPROFILE\scoop\apps\pwsh\current\install-file-context.reg"
