Write-Host "starting env.ps1 script..." -ForegroundColor DarkGreen

$SetupEnv = @{
  XDG_CONFIG_HOME = "$HOME\.config"; # config files (write)
  XDG_DATA_HOME = "$HOME\.local\share"; # user data (write)
  XDG_CACHE_HOME = "$HOME\.cache"; # non-essential data (read/write)
  EZA_CONFIG_DIR = "$HOME\.config\eza"; # eza theme
  BAT_CONFIG_DIR = "$HOME\.config\bat"; # bat config
  YAZI_CONFIG_HOME = "$HOME\.config\yazi";
  YAZI_FILE_ONE = "$HOME\scoop\apps\git\current\usr\bin\file.exe"; # preview feature 
  BLENDER_USER_RESOURCES = "$HOME\.local\etc\blender\current";
  # npm_config_cache = "D:\archive\cache\npm";
  # CARGO_HOME = "D:\archive\packages\cargo";
  # PIP_CACHE_DIR = "D:\archive\cache\pip";
}

Write-Host "setting up environment variables..." -ForegroundColor DarkGreen

foreach ($Key in $SetupEnv.Keys) {
  $tmpPath = $SetupEnv[$Key]

  # Check if the environment variable already exists
  $currentValue = [System.Environment]::GetEnvironmentVariable($Key, [System.EnvironmentVariableTarget]::User)

  if ($currentValue -eq $null -or $currentValue -ne $tmpPath) {
    # Update the environment variable if it doesn't exist or the value is different
    Write-Output "Setting environment variable $Key to $tmpPath"
    [System.Environment]::SetEnvironmentVariable($Key, $tmpPath, [System.EnvironmentVariableTarget]::User)
  } else {
    # Skip updating if the variable is already set correctly
    Write-Output "Environment variable $Key is already set to $tmpPath. Skipping..."
  }
}

# foreach ($Key in $SetupEnv.Keys) {
#   $tmpPath = $SetupEnv[$Key]
#   Write-Output "Setting environment variable $Key to $tmpPath"
#   [System.Environment]::SetEnvironmentVariable($Key, $tmpPath, [System.EnvironmentVariableTarget]::User)
# }

Write-Host "env.ps1 script finished." -ForegroundColor DarkGreen
