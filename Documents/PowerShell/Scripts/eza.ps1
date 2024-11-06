if (!(Get-Command -Name "eza" -ErrorAction SilentlyContinue))
{
  return
}

$DEFAULT_EZA_ARGS = @(
  "--colour=always",
  "--git",
  "--group-directories-first",
  "--icons=always",
  "--ignore-glob=.DS_Store",
  "--no-quotes",
  "--sort=type"
)

function _ls
{
  eza @DEFAULT_EZA_ARGS @args
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
  eza --tree --level=3 @DEFAULT_EZA_ARGS @args
}
# how to setup alias: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/set-alias?view=powershell-7.4
Set-Alias -Name ls -Value _ls -Force
