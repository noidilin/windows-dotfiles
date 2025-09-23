Write-Host "starting env.ps1 script..." -ForegroundColor White

$NamedEnv = @{
  XDG_DATA_HOME = "$HOME\.local\share"; # user data (write)
  XDG_CONFIG_HOME = "$HOME\.config"; # config files (write)
  XDG_STATE_HOME = "$HOME\.local\state"; # user state (write)
  XDG_CACHE_HOME = "$HOME\.cache"; # non-essential data (read/write)
  EZA_CONFIG_DIR = "$HOME\.config\eza"; # eza theme
  BAT_CONFIG_DIR = "$HOME\.config\bat"; # bat config
  YAZI_CONFIG_HOME = "$HOME\.config\yazi";
  YAZI_FILE_ONE = "$HOME\scoop\apps\git\current\usr\bin\file.exe"; # preview feature
  BLENDER_USER_RESOURCES = "$HOME\.local\etc\blender";
  PNPM_HOME = "$HOME\.dev\pnpm"
  BUN_INSTALL_GLOBAL_DIR = "$HOME\.dev\bun\install\global" # where `bun install --global` installs packages
  BUN_INSTALL_BIN = "$HOME\.dev\bun\bin" # where globally-installed package bins are linked
  BUN_INSTALL_CACHE_DIR = "$HOME\.dev\bun\install\cache" # all downloaded packages are stored in global cache
  CARGO_HOME = "$HOME\.dev\cargo";
  RUSTUP_HOME = "$HOME\.dev\rustup"
  # npm_config_cache = "D:\archive\cache\npm";
  # PIP_CACHE_DIR = "D:\archive\cache\pip";
}

# List of directories to add to PATH
$PathsToAdd = @(
  "$HOME\.dev\pnpm"
  "$HOME\.dev\bun\bin"
)

Write-Host "setting up environment variables..." -ForegroundColor Gray

foreach ($Key in $NamedEnv.Keys) {
  $tmpPath = $NamedEnv[$Key]

  # Check if the environment variable already exists
  $currentValue = [System.Environment]::GetEnvironmentVariable($Key, [System.EnvironmentVariableTarget]::User)

  if ($currentValue -eq $null -or $currentValue -ne $tmpPath) {
    # Update the environment variable if it doesn't exist or the value is different
    Write-Host "setting environment variable $Key to $tmpPath" -ForegroundColor DarkGreen
    [System.Environment]::SetEnvironmentVariable($Key, $tmpPath, [System.EnvironmentVariableTarget]::User)
  } else {
    # Skip updating if the variable is already set correctly
    Write-Host "environment variable $Key is already set to $tmpPath. (skipping...)" -ForegroundColor DarkGray
  }
}

Write-Host "updating PATH variable..." -ForegroundColor Gray

# Get the current PATH variable
$CurrentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)

# Iterate over each directory in PathsToAdd
foreach ($Path in $PathsToAdd) {
  if ($CurrentPath -notmatch [regex]::Escape($Path)) {
    Write-Host "adding $Path to PATH" -ForegroundColor DarkGreen
    $CurrentPath += ";$Path"
  } else {
    Write-Host "$Path is already in PATH. (skipping...)" -ForegroundColor DarkGray
  }
}

# Update the PATH environment variable if changes were made
[System.Environment]::SetEnvironmentVariable("Path", $CurrentPath, [System.EnvironmentVariableTarget]::User)

Write-Host "env.ps1 script finished." -ForegroundColor Green
