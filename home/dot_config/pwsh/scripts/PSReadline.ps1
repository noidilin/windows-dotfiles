$Colors = @{
  # Powershell colours
  ContinuationPrompt     = "#5d5d5d" # white
  Emphasis               = "#eaeaea" # bright-cyan
  Selection              = "#353535" # $Flavor.Surface0.Background()
  # PSReadLine prediction colours
  InlinePrediction       = "#474747" # 
  ListPrediction         = "#474747" # yellow
  ListPredictionSelected = "#353535" # $Flavor.Surface0.Background()
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

$ScriptBlock = {
  Param([string]$line)
  if ($line -like " *") { return $false }
  $ignore_psreadline = @("user", "pass", "account")
  foreach ($ignore in $ignore_psreadline) {
    if ($line -match $ignore) { return $false }
  }
  return $true
}

$PSReadLineOptions = @{
  BellStyle = "None" # no feedback to error
  Color = $Colors
  AddToHistoryHandler = $ScriptBlock
  HistoryNoDuplicates = $true
  HistorySearchCursorMovesToEnd = $true
  MaximumHistoryCount = 5000
  ExtraPromptLineCount = $true
  # EditMode = "Windows" # default: windows
  # ShowToolTips = $true # default: true
  # PredictionViewStyle = "ListView"
}
Set-PSReadLineOption @PSReadLineOptions

Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "Ctrl+y" -Function MenuComplete

<# function Clear-PSReadLineHistory {
  Get-PSReadlineOption | Select-Object -expand HistorySavePath | Remove-Item
} #>

# ref: https://github.com/catppuccin/powershell/blob/main/Catppuccin.psm1
# bg: "[48", fg: "[38"
$PSStyle.Formatting.FormatAccent = "$([char]27)[38;2;$(157);$(157);$(157)m" # fg: #9d9d9d
$PSStyle.Formatting.ErrorAccent = "$([char]27)[38;2;$(204);$(147);$(147)m" # fg: #cc9393
$PSStyle.Formatting.Error = "$([char]27)[38;2;$(176);$(120);$(120)m" # # fg: #b07878
$PSStyle.Formatting.Warning = "$([char]27)[38;2;$(220);$(181);$(165)m" # fg: #dcb5a5
$PSStyle.Formatting.Verbose = "$([char]27)[38;2;$(200);$(164);$(146)m" # fg: #c8a492
$PSStyle.Formatting.Debug = "$([char]27)[38;2;$(200);$(164);$(146)m" # fg: #c8a492
$PSStyle.Formatting.TableHeader = "$([char]27)[38;2;$(157);$(157);$(157)m" # fg: #9d9d9d
$PSStyle.Formatting.CustomTableHeaderLabel = "$([char]27)[38;2;$(204);$(204);$(204)m" # fg: #cccccc
$PSStyle.FileInfo.Directory = "$([char]27)[48;2;$(65);$(65);$(65)m" # bg: #4e4e4e
$PSStyle.FileInfo.SymbolicLink = "$([char]27)[38;2;$(180);$(176);$(167)m" # fg: #b4b0a7
$PSStyle.FileInfo.Executable = "$([char]27)[38;2;$(142);$(137);$(125)m" # fg: #8e897d

