if (!(Get-Command -Name "eza" -ErrorAction SilentlyContinue)) { return }

$DEFAULT_EZA_ARGS = @(
  "--colour=always"
  "--git"
  "--group-directories-first"
  "--icons=always"
  "--ignore-glob=.DS_Store"
  "--no-quotes"
  "--sort=type"
)

function _ls {
  eza @DEFAULT_EZA_ARGS @args
}

# function l {
#   eza -l @DEFAULT_EZA_ARGS @args
# }
#
# function ll {
#   eza -lag @DEFAULT_EZA_ARGS @args
# }
#
# function ld {
#   eza -lD @DEFAULT_EZA_ARGS @args
# }
#
# function lt {
#   eza --tree --level=3 @DEFAULT_EZA_ARGS @args
# }

Set-Alias -Name ls -Value _ls -Force
