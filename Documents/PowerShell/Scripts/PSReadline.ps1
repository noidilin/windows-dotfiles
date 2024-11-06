# Import-Module Catppuccin
# $Flavor = $Catppuccin['Mocha']

# used in fzf
$ScriptBlock = {
  Param([string]$line)
  if ($line -like " *")
  {return $false
  }
  $ignore_psreadline = @("user", "pass", "account")
  foreach ($ignore in $ignore_psreadline)
  {
    if ($line -match $ignore)
    {
      return $false
    }
  }
  return $true
}

# Ref: https://learn.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.4
$Colors = @{
  # Powershell colours
  ContinuationPrompt     = "#5d5d5d" # white
  Emphasis               = "#eaeaea" # bright-cyan
  # Selection              = "#878787" # $Flavor.Surface0.Background()
	
  # PSReadLine prediction colours
  InlinePrediction       = "#474747" # 
  ListPrediction         = "#474747" # yellow
  # ListPredictionSelected = "#" # $Flavor.Surface0.Background()

  # Syntax highlighting
  Command                = "#dad5c8" # bright-yellow
  Comment                = "#555555" # green
  Default                = "#b3b3b3" # white
  Error                  = "#b07878" # bright-red
  Keyword                = "#9d9d9d" # bright-green
  Member                 = "#c0c0c0" # white
  Number                 = "#878787" # bright-white
  Operator               = "#9d9d9d" # 
  Parameter              = "#878787" # 
  String                 = "#707070" # 
  Type                   = "#eaeaea" # white
  Variable               = "#878787" # bright-green
}

$PSReadLineOptions = @{
  EditMode = "Windows"
  AddToHistoryHandler = $ScriptBlock
  Color = $Colors
  ExtraPromptLineCount = $true
  HistoryNoDuplicates = $true
  HistorySearchCursorMovesToEnd = $true
  MaximumHistoryCount = 5000
  # support by completion predictor (https://github.com/PowerShell/CompletionPredictor)
  PredictionSource = "HistoryAndPlugin" 
  # PredictionViewStyle = "ListView"
  ShowToolTips = $true
  BellStyle = "None"
}
Set-PSReadLineOption @PSReadLineOptions

Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward
# Set-PSReadLineKeyHandler -Key "Ctrl+w" -Function BackwardDeleteWord
# Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord
# Set-PSReadLineKeyHandler -Key "Ctrl+b" -Function BackwardWord

# https://ianmorozoff.com/2023/01/10/predictive-intellisense-on-by-default-in-powershell-7-3/#keybinding
<#
$parameters = @{
  Key = 'F4'
  BriefDescription = 'Toggle PSReadLineOption PredictionSource'
  LongDescription = 'Toggles the PSReadLineOption PredictionSource option between "None" and "HistoryAndPlugin".'
  ScriptBlock = {

    # Get current state of PredictionSource
    $state = (Get-PSReadLineOption).PredictionSource

    # Toggle between None and HistoryAndPlugin
    switch ($state)
    {
      "None"
      {Set-PSReadLineOption -PredictionSource HistoryAndPlugin
      } 
      "History"
      {Set-PSReadLineOption -PredictionSource None
      }
      "Plugin"
      {Set-PSReadLineOption -PredictionSource None
      }
      "HistoryAndPlugin"
      {Set-PSReadLineOption -PredictionSource None
      }
      Default
      {Write-Host "Current PSReadLineOption PredictionSource is Unknown"
      }
    }

    # Trigger autocomplete to appear without changing the line
    # InvokePrompt() does not cause ListView style suggestions to disappear when toggling off
    #[Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()

    # Trigger autocomplete to appear or disappear while preserving the current input
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert(' ')
    [Microsoft.PowerShell.PSConsoleReadLine]::BackwardDeleteChar()

  }
}
Set-PSReadLineKeyHandler @parameters
#>

# Clear PSReadLine history
function Clear-PSReadLineHistory
{
  Get-PSReadlineOption | Select-Object -expand HistorySavePath | Remove-Item
}
