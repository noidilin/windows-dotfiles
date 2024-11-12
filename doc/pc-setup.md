# PC Setup

- [ ] blender config workflow can be optimized
  - [ ] blender config: `~\AppData\Roaming\Blender Foundation\Blender\`
  - [ ] blender preset: `~\blender\`
  - [ ] addon-zip: `D:\resource\blender\addon`
  - [ ] asset: `D:\resource\blender`
- [ ] resolve config workflow can be optimized
  - [ ] user preference is located in `~/.config/resolve/`
  - [ ] database is located in `~/resolve/`

## Install Win11

Use **_Rufus_** to make iso USB drive to avoid microsoft online account validation which could ruin your user name (user folder name). Changing user name afterward is hard and has the possibility to break some essential features.

### Use Rufus to create bootable drive

1. download and launch rufus
2. select preferred flash drive to create bootable USB iso
3. select win 11 iso file downloaded from microsoft website
4. click start
5. check 'remove requirement for an online microsoft account'
6. check 'create a local account with username'
   - specify a name for the account
   - bypass other restriction if you want
7. click ok

### Driver

- motherboard (X570 Meg Ace):
  - it will automatically prompt to install necessary motherboard driver.
  - remember to uncheck some unnecessary application
- cpu: amd razen master
- gpu: studio version
- hard drive: acronis true image WD
- wacom tablet

### Other system setting

- [[Correcting HDMI and DP Color on Nvidia GPUs]]
- [ ] install cursor icon in the `.config/cursor/`
  - this step require chezmoi

### D drive backup

Files in D drive is backed up into two places:

`My Book` drive with acronis true image WD:

- project: current project
- area: download folder, obsidian vault, render folder
- resource: texture, FX asset, blender (asset, addon)
- archive: application cache

`oneDrive`:

- project: temp synced files
- area: obsidian asset back up
- resource: learn resource, installation preset, reference library
- archive: occasionally used files, one drive default system backup

---

## UniGet for installation

### `winget` Install uniget

```sh
winget install --id marticliment.unigetui
```

- gui
- dev-winget
- dev-npm (manually)
  - `npm i -g vsce yo generator-code`
  - `npm i -g tldr`
  - `npm i -g rimraf`
- dev-pwsh (manually install)

```sh
Install-Module -Name Microsoft.WinGet.Client
Install-Module -Name PSReadLine -AllowPrerelease
Install-Module -Name CompletionPredictor
Install-Module -Name PSFzf -RequiredVersion 2.6.1
```

---

## Chezmoi for configuration

> [!hint] setup browser and git first  
> chezmoi is powered by git. Therefore, you need to setup ssh connection with github account.

```sh
chezmoi init --apply git@github.com:noidilin/windows-dotfiles.git
```

> [!caution] manually setup  
> config that need to setup manually will be represented with checkbox.

### `~`

- [ ] `.wezterm.lua`: config
  - needs to setup `.config/wezterm/` from chezmoi external
- `.glzr/`: theme, config
- `resolve/`: manually link 'Resolve Project' as database
- `.gitconfig`: info, config, delta
- `FlexASIO.toml`: config

### `~/.config`

- [ ] `firefox/`: global speed, sidebery, tampermonkey, tweaks for youtube, youtube subscription manager
  - manually import settings in the application
- [ ] `stylus/`: color-fatigue.json
  - manually import settings in the application
- [ ] `pureref/`: theme
  - manually import theme in the application
- [ ] `shareX/`: theme, config
  - manually assign config path in the application
- `delta/`: theme
- `vscode/`: css
- `formatter/`: prettier, markdownlint
- `starship.toml`: theme, config
- (backup) `uniget/`: uniget bundle
- (backup) `resolve/`: preference
- (backup) `keyboard/`: bioi g60, cidoo abm066, dz60, lot60

### `~/Documents/PowerShell/`

- powershell: profile, cli tool config

### `AppData/`

#### `Local/`

- windows terminal: theme
- lazygit: theme, config
- superfile: theme, config
- [ ] nvim: config (nvim and vscode)
  - install `msy32` for treesitter ([Get Started with C++ and MinGW-w64 in Visual Studio Code](https://code.visualstudio.com/docs/cpp/config-mingw))

#### `Roaming/`

- [ ] bat: theme
  - theme config needs to be built with command: `bat cache --build`
- [ ] flow launcher: theme
  - needs to be setup in the UI
- [ ] rime weasel: theme, config
  - needs to be built through context menu
- blender: config, preset theme
- bottom: theme, config
- yazi: theme, config, plugin

---

## Other application

### Resolve plugin

- mInstaller
- Dehancer Pro
- VST3
  - CLA-76
  - Voice centric
  - Playlist Rider
  - NS1
  - MV2
  - WLM Meter
  - WLM Plus
  - Vocal Doubler
  - MSED
  - Ozone Imager 2
  - Vinyl
  - T-De-Esser
  - Cymatics origin

### Blender

application

- Batch Render Creator
- UV pack master core
- zen UV core

addon-zip: `D:\resource\blender\addon`
asset: `D:\resource\blender`  
texture: `D:\resource\tex`

### Reference library

eagle and pureref library is synced with oneDrive.
