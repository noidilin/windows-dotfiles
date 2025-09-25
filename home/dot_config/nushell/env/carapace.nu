export const CARAPACE_INIT_PATH = ($nu.cache-dir | path join carapace init.nu)

# Creates an `init.nu` file via `starship init …` at `CARAPACE_INIT_PATH`.
export def init-carapace [] {
	mkdir ($CARAPACE_INIT_PATH | path dirname)
	carapace _carapace nushell | save -f $CARAPACE_INIT_PATH
}

# styles will be saved at ~/.config/carapace/styles.json
def style-carapace [] {
  carapace --style "carapace.Description=fg-#4e4e4e,italic"
  carapace --style "carapace.Error=fg-#b07878,bold"
  carapace --style "carapace.Usage=fg-#9d9d9d"
  carapace --style "carapace.Value=fg-#878787"
  carapace --style "carapace.FlagArg=fg-#707070"
  carapace --style "carapace.FlagMultiArg=fg-#707070"
  carapace --style "carapace.FlagNoArg=fg-#5d5d5d"
  carapace --style "carapace.FlagOptArg=fg-#5d5d5d"
  carapace --style "carapace.Highlight1=fg-#dcdcdc"
  carapace --style "carapace.Highlight2=fg-#c0c0c0"
  carapace --style "carapace.Highlight3=fg-#aaaaaa"
  carapace --style "carapace.Highlight4=fg-#8e8e8e"
  carapace --style "carapace.Highlight5=fg-#7f7f7f"
  carapace --style "carapace.Highlight6=fg-#686868"
  carapace --style "carapace.Highlight7=fg-#7b7974"
  carapace --style "carapace.Highlight8=fg-#8e8b85"
  carapace --style "carapace.Highlight9=fg-#97948c"
  carapace --style "carapace.Highlight10=fg-#a19d97"
  carapace --style "carapace.Highlight11=fg-#b4b0a7"
  carapace --style "carapace.Highlight12=fg-#bdbab2"
  carapace --style "carapace.KeywordAmbiguous=fg-#5d5d5d"
  carapace --style "carapace.KeywordNegative=fg-#c8a492"
  carapace --style "carapace.KeywordPositive=fg-#778777"
  carapace --style "carapace.KeywordUnknown=fg-#4e4e4e"
  carapace --style "carapace.LogLevelCritical=fg-#b07878,bold"
  carapace --style "carapace.LogLevelDebug=fg-#707070"
  carapace --style "carapace.LogLevelError=fg-#b07878"
  carapace --style "carapace.LogLevelFatal=fg-#b07878,bold"
  carapace --style "carapace.LogLevelInfo=fg-#4e4e4e"
  carapace --style "carapace.LogLevelTrace=fg-#5d5d5d"
  carapace --style "carapace.LogLevelWarning=fg-#c8a492"
}
