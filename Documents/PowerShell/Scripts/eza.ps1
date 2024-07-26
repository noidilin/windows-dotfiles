if (!(Get-Command -Name "eza" -ErrorAction SilentlyContinue))
{
  return
}

$DEFAULT_EZA_ARGS = @(
  "--colour=always",
  "--grid",
  "--icons=always",
  "--sort=type",
  "--git",
  "--ignore-glob=.DS_Store",
  "--no-quotes"
)

function _ls
{
  eza -1 @DEFAULT_EZA_ARGS @args
}

function l
{
  eza -l @DEFAULT_EZA_ARGS @args
}

function ll
{
  eza -lag @DEFAULT_EZA_ARGS @args
}

function ld
{
  eza -lD @DEFAULT_EZA_ARGS @args
}

function lt
{
  eza --tree @DEFAULT_EZA_ARGS @args
}
# how to setup alias: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/set-alias?view=powershell-7.4
Set-Alias -Name ls -Value _ls -Force