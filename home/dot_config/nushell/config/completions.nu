export def main [] {
  let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
  }

  let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | $"value(char tab)description(char newline)" + $in
    | from tsv --flexible --no-infer
  }

  let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
  }

# alias expansion and different completers
  let external_completer = {|spans|
    let expanded_alias = (scope aliases | where name == $spans.0 | get --optional 0 | get --optional expansion)

    let spans = if $expanded_alias != null {
      $spans
      | skip 1
      | prepend ($expanded_alias | split row ' ')
    } else {
      $spans
    }

    match $spans.0 {
      # nu => $fish_completer
      # asdf => $fish_completer
      # git => $fish_completer
      z => $zoxide_completer
      zi => $zoxide_completer
      _ => $carapace_completer
    } | do $in $spans
  }
  return {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true    # set this to false to prevent auto-selecting completions when only one remains
    partial: true    # set this to false to prevent partial filling of the prompt
    algorithm: "prefix"    # prefix or fuzzy
    sort: "smart" # "smart" (alphabetical for prefix matching, fuzzy score for fuzzy matching) or "alphabetical"
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: $external_completer
    }
    use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
  }
}
