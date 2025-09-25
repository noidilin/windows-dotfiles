# Commands

## PowerShell

- `rl`: reload profile
- `lg`: lazygit

### PSReadLine

- `<C-n>`: history search (forward)
- `<C-p>`: history search (backward)

command: `Clear-PSReadLineHistory`

### eza

- `ls`: eza
- `lt`: recurse into directories as a tree, (3 level deep)
- `l`: extended details and attributes
- `ll`: extended details and attributes, show hidden, list each file group
- `ld`: extended details and attributes, list only directories

### fzf

- `<C-t>`: fuzzy-find under cwd
- `<C-r>`: fuzzy-find command history
- `fe` (EnableAliasFuzzyEdit): start an editor for the selected files in the fuzzy finder
- `fgs` (EnableAliasGitStatus): starts fzf with input from output of the git status function
- `fkill` (EnableAliasFuzzyKillProcess): runs Stop-Process on processes selected by the user in fzf

### Clean

command:

- `Delete-RecyleBin`
- `Delete-TempData`
- `Run-DiskCleanUp`
- `Clean-All`: run all clean commands

### color-fatigue

command: `Replace-MochaPalette` (for example `Replace-MochaPalette flavor.toml`)

### stylus

command: `Update-CatppuccinStylus`

1. download or update catppuccin stylus to `~\.config\stylus\color-fatigue.json`
2. execute `Replace-MochaPalette` command with `-stylus` option on
