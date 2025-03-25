$env.FZF_DEFAULT_COMMAND = "fd --hidden --strip-cwd-prefix --exclude .git"
$env.FZF_CTRL_T_COMMAND = $env.FZF_DEFAULT_COMMAND
$env.FZF_ALT_C_COMMAND = "fd --type directory --hidden --strip-cwd-prefix --exclude .git"

# generated theme permalink: https://vitormv.github.io/fzf-themes#eyJib3JkZXJTdHlsZSI6InJvdW5kZWQiLCJib3JkZXJMYWJlbCI6ImZ6ZiIsImJvcmRlckxhYmVsUG9zaXRpb24iOjAsInByZXZpZXdCb3JkZXJTdHlsZSI6InJvdW5kZWQiLCJwYWRkaW5nIjoiMiIsIm1hcmdpbiI6IjIiLCJwcm9tcHQiOiI+ICIsIm1hcmtlciI6Ij4iLCJwb2ludGVyIjoi4peGIiwic2VwYXJhdG9yIjoi4pSAIiwic2Nyb2xsYmFyIjoi4pSCIiwibGF5b3V0IjoicmV2ZXJzZSIsImluZm8iOiJyaWdodCIsImNvbG9ycyI6ImZnOiM4ZThlOGUsZmcrOiNiM2IzYjMsYmc6IzE5MTkxOSxiZys6IzE5MTkxOSxobDojYTY5ZjkxLGhsKzojZGFkNWM4LGluZm86IzQ3NDc0NyxtYXJrZXI6I2IzYWQ5Zixwcm9tcHQ6I2VhZWFlYSxzcGlubmVyOiM3MDZjNjIscG9pbnRlcjojOGU4OTdkLGhlYWRlcjojYjNiM2IzLGJvcmRlcjojMmEyYTJhLGxhYmVsOiNiM2IzYjMscXVlcnk6I2RjZGNkYyJ9 
# bg set to -1 will use the terminal default bg color
$env.FZF_DEFAULT_OPTS = "
--color=fg:#8e8e8e,fg+:#b3b3b3,bg:-1,bg+:-1 \n
--color=hl:#a69f91,hl+:#dad5c8,info:#474747,marker:#8e897d \n
--color=prompt:#eaeaea,spinner:#706c62,pointer:#8e897d,header:#b3b3b3 \n
--color=border:#2a2a2a,label:#b3b3b3,query:#dcdcdc \n
--padding='2' --margin='2' --layout=reverse --info='right' \n
--prompt='> ' --marker='>' --pointer='◆' --separator='─' --scrollbar='│'  \n
--border='rounded' --border-label='fzf' --border-label-pos='0'  \n
--cycle --scroll-off=5 \n
--preview-window=right,60%,border-left \n
--bind ctrl-u:preview-half-page-up \n
--bind ctrl-d:preview-half-page-down \n
--bind ctrl-f:preview-page-down \n
--bind ctrl-b:preview-page-up \n
--bind ctrl-g:preview-top \n
--bind ctrl-h:preview-bottom \n
--bind alt-w:toggle-preview-wrap \n
--bind ctrl-e:toggle-preview \n
"

# define the conditional preview logic
# ISSUE: can't parse the `\` character in {} correctly (nushell think it is an escape character)
# $env.FZF_CTRL_T_OPTS = "--height 80% --preview 'nu -c \"if ((\"{}\" | path type) == dir) { eza --tree --level=2 --color=always --icons=always {} } else { bat -n --color=always --line-range :500 {} }\"'"
$env.FZF_CTRL_T_OPTS = "--height 80% --preview 'bat -n --color=always --line-range=:500 {}'"
$env.FZF_ALT_C_OPTS = "--height 80% --preview 'eza --tree --level=2 --color=always {} '"
