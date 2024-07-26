# create fzf theme: https://vitormv.github.io/fzf-themes/
# generated theme permalink: https://vitormv.github.io/fzf-themes#eyJib3JkZXJTdHlsZSI6InJvdW5kZWQiLCJib3JkZXJMYWJlbCI6ImZ6ZiIsImJvcmRlckxhYmVsUG9zaXRpb24iOjAsInByZXZpZXdCb3JkZXJTdHlsZSI6InJvdW5kZWQiLCJwYWRkaW5nIjoiMiIsIm1hcmdpbiI6IjIiLCJwcm9tcHQiOiI+ICIsIm1hcmtlciI6Ij4iLCJwb2ludGVyIjoi4peGIiwic2VwYXJhdG9yIjoi4pSAIiwic2Nyb2xsYmFyIjoi4pSCIiwibGF5b3V0IjoicmV2ZXJzZSIsImluZm8iOiJyaWdodCIsImNvbG9ycyI6ImZnOiM4ZThlOGUsZmcrOiNiM2IzYjMsYmc6IzE5MTkxOSxiZys6IzE5MTkxOSxobDojYTY5ZjkxLGhsKzojZGFkNWM4LGluZm86IzQ3NDc0NyxtYXJrZXI6I2IzYWQ5Zixwcm9tcHQ6I2VhZWFlYSxzcGlubmVyOiM3MDZjNjIscG9pbnRlcjojOGU4OTdkLGhlYWRlcjojYjNiM2IzLGJvcmRlcjojMmEyYTJhLGxhYmVsOiNiM2IzYjMscXVlcnk6I2RjZGNkYyJ9 

# PSFzf Doc: https://github.com/kelleyma49/PSFzf

# Ref: https://github.com/catppuccin/powershell#profile-usage 
# https://github.com/catppuccin/fzf - not use background for transparent
# Import-Module Catppuccin
# $Flavor = $Catppuccin['Mocha']

# bg set to -1 will use the terminal default bg color
# --preview-window="border-rounded"

$env:FZF_DEFAULT_OPTS=@"
--color=fg:#8e8e8e,fg+:#b3b3b3,bg:-1,bg+:-1
--color=hl:#a69f91,hl+:#dad5c8,info:#474747,marker:#b3ad9f
--color=prompt:#eaeaea,spinner:#706c62,pointer:#8e897d,header:#b3b3b3
--color=border:#2a2a2a,label:#b3b3b3,query:#dcdcdc
--padding="2" --margin="2" --layout=reverse --info="right"
--prompt="> " --marker=">" --pointer="◆" --separator="─" --scrollbar="│" 
--border="rounded" --border-label="fzf" --border-label-pos="0" 
--cycle --scroll-off=5
 --preview-window=right,60%,border-left
--bind ctrl-u:preview-half-page-up
--bind ctrl-d:preview-half-page-down
--bind ctrl-f:preview-page-down
--bind ctrl-b:preview-page-up
--bind ctrl-g:preview-top
--bind ctrl-h:preview-bottom
--bind alt-w:toggle-preview-wrap
--bind ctrl-e:toggle-preview
"@

$env:FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
$env:FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
$env:FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"


# Add preview to ctrl+t and alt+c command
$show_file_or_dir_preview = "if (Test-Path -PathType Container '{}') { eza --tree --level=3 --color=always --icons=always '{}' } else { bat -n --color=always --line-range :500 '{}' }"
$env:FZF_CTRL_T_OPTS="--preview 'powershell -Command $show_file_or_dir_preview'"

# TODO: pipe in powershell doesn't seems to work
$env:FZF_ALT_C_OPTS="--preview 'eza --tree --level=3 --color=always --icons=always {}'"

# Set-Location Based on Selected Directory 
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
Set-PsFzfOption -AltCCommand $commandOverride
# Replace the standard tab completion
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# -EnableAliasFuzzyScoop: fs (start fzf on scoop app list)
# -EnableAliasFuzzyFasd: ff (start fzf with input from the files saved in fasdr)
# -EnableAliasFuzzyEdit: fe (start an editor for the selected files in the fuzzy finder)
# -EnableAliasGitStatus: fgs (starts fzf with input from output of the git status function)
# -EnableAliasFuzzyKillProcess: fkill (runs Stop-Process on processes selected by the user in fzf)

Set-PsFzfOption -PSReadlineChordProvider "Ctrl+t" -PSReadlineChordReverseHistory "Ctrl+r" -GitKeyBindings -TabExpansion -EnableAliasFuzzyGitStatus -EnableAliasFuzzyEdit -EnableAliasFuzzyKillProcess 

function _get_path_using_fd
{
  $input_path = fd --type file --follow --hidden --exclude .git |
    fzf --prompt 'Files> ' `
      --header-first `
      --header '<ctrl+s>: switch between files / directories' `
      --bind 'ctrl-s:transform:if not "%FZF_PROMPT%"=="Files> " (echo ^change-prompt^(Files^> ^)^+^reload^(fd --type file^)) else (echo ^change-prompt^(Directory^> ^)^+^reload^(fd --type directory^))' `
      --preview 'if "%FZF_PROMPT%"=="Files> " (bat --color=always {} --style=plain) else (eza -T --colour=always --icons=always {})'
  return $input_path
}

Set-Alias -Name fdg -Value _get_path_using_fd

<# 
function _open_path
{
  param (
    [string]$input_path
  )
  if (-not $input_path)
  {
    return
  }
  Write-Output "[ ] cd"
  Write-Output "[r] rm"
  Write-Output "[v] nvim"
  $choice = Read-Host "Enter your choice"
  if ($input_path -match "^.*:\d+:.*$")
  {
    $input_path = ($input_path -split ":")[0]
  }
  switch ($choice)
  {
    "r"
    { 
      Remove-Item $input_path -Recurse -Confirm
    }
    "v"
    { 
      nvim $input_path
    }
    {$_ -eq "" -or $_ -eq " "}
    {
      if (Test-Path -Path $input_path -PathType Leaf)
      {
        $input_path = Split-Path -Path $input_path -Parent
      }
      Set-Location -Path $input_path
    }
    default
    {
      Write-Host "Selection is invalid!"
    }
  }
}

function _get_path_using_rg
{
  $INITIAL_QUERY = "${*:-}"
  $RG_PREFIX = "rg --column --line-number --no-heading --color=always --smart-case"
  $input_path = "" |
    fzf --ansi --disabled --query "$INITIAL_QUERY" `
      --bind "start:reload:$RG_PREFIX {q}" `
      --bind "change:reload:sleep 0.2 & $RG_PREFIX {q} || rem" `
      --bind 'ctrl-s:transform:if not "%FZF_PROMPT%" == "1. ripgrep> " (echo ^rebind^(change^)^+^change-prompt^(1. ripgrep^> ^)^+^disable-search^+^transform-query:echo ^{q^} ^> %TEMP%\rg-fzf-f ^& cat %TEMP%\rg-fzf-r) else (echo ^unbind^(change^)^+^change-prompt^(2. fzf^> ^)^+^enable-search^+^transform-query:echo ^{q^} ^> %TEMP%\rg-fzf-r ^& cat %TEMP%\rg-fzf-f)' `
      --color "hl:-1:underline,hl+:-1:underline:reverse" `
      --delimiter ":" `
      --prompt '1. ripgrep> ' `
      --preview-label "Preview" `
      --header 'CTRL-S: Switch between ripgrep/fzf' `
      --header-first `
      --preview 'bat --color=always {1} --highlight-line {2} --style=plain' `
      --preview-window 'up,60%,border-bottom,+{2}+3/3'
  return $input_path
}

function fdg
{
  _open_path $(_get_path_using_fd)
}

function rgg
{
  _open_path $(_get_path_using_rg)
}

Set-PSReadLineKeyHandler -Key "Ctrl+f" -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert("fdg")
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Key "Ctrl+g" -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert("rgg")
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
} #>