# Ref: https://gist.github.com/dougwaldron/d510f2d67a922da169aca1aeff7e4c4d

Write-Host "starting winget.ps1 script..."

$WINGET_GUI = @(
  # @{name = "MartiCliment.UniGetUI"}
  # @{name = "Microsoft.PowerToys" }
  # @{name = "Olivia.VIA"}
  # @{name = "Flow-Launcher.Flow-Launcher"}
  # @{name = "voidtools.Everything"}
  # @{name = "Microsoft.VisualStudioCode" }
  # @{name = "wez.wezterm"}
  @{name = "glzr-io.glazewm" }
  @{name = "Rime.Weasel"}
  @{name = "dechamps.FlexASIO" }
  @{name = "CyberPowerSystemsInc.PowerPanelPersonal" }
  @{name = "SteelSeries.GG"}
  @{name = "Wacom.WacomTabletDriver"}
  # @{name = "Crucial.StorageExecutive"}
  # @{name = "lukehaas.RunJS" }
  @{name = "ogdesign.Eagle"}
  @{name = "WavesAudio.WavesCentral"}
  # @{name = "Mozilla.Firefox.DeveloperEdition" }
  @{name = "Zen-Team.Zen-Browser.Optimized"}
)

Write-Host "installing winget apps..."
Foreach ($app in $WINGET_GUI) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install --exact --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --id $app.name
    }
    else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}
