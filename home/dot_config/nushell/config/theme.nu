# Retrieve the theme settings
export def main [] {
  let p = {
    mono25: '#eaeaea'
    mono24: '#dcdcdc'
    mono23: '#cccccc'
    mono22: '#c0c0c0'
    mono21: '#b3b3b3' # text
    mono20: '#aaaaaa'
    mono19: '#9d9d9d' # subtext1
    mono18: '#8e8e8e'
    mono17: '#878787' # subtext0
    mono16: '#7f7f7f'
    mono15: '#707070' # overlay2
    mono14: '#686868'
    mono13: '#5d5d5d' # overlay1
    mono12: '#555555'
    mono11: '#4e4e4e' # overlay0
    mono10: '#474747'
    mono09: '#414141' # surface2
    mono08: '#3a3a3a'
    mono07: '#353535' # surface1
    mono06: '#303030'
    mono05: '#2a2a2a' # surface0
    mono04: '#242424'
    mono03: '#1e1e1e' # base
    mono02: '#191919' # mantle
    mono01: '#151515' # crust
    mono00: '#101010'

    acc08: '#faf5eb'
    acc07: '#dad5c8'
    acc06: '#c0baad'
    acc05: '#b3ad9f'
    acc04: '#a69f91'
    acc03: '#9a9487'
    acc02: '#8e897d'
    acc01: '#7f7b70'
    acc00: '#706c62'
    accDim08: '#f7f4ed'
    accDim07: '#d6d3cc'
    accDim06: '#bdbab2'
    accDim05: '#b4b0a7'
    accDim04: '#a19d97'
    accDim03: '#97948c'
    accDim02: '#8e8b85'
    accDim01: '#7b7974'
    accDim00: '#6c6a65'

	  red01: '#cc9393'
	  red00: '#b07878'
	  green01: '#9bb09b'
	  green00: '#778777'
	  yellow01: '#ebd6b7'
	  yellow00: '#d6caab'
	  blue01: '#9db2cf'
	  blue00: '#7d96ad'
	  magenta01: '#9f9fbd'
	  magenta00: '#797994'
	  cyan01: '#92b3b3'
	  cyan00: '#769494'
	  orange01: '#dcb5a5'
	  orange00: '#c8a492'
  }

  return {
    binary: $p.mono19
    block: $p.mono17
    cell-path: $p.mono18
    closure: $p.mono20
    custom: $p.acc05
    duration: $p.mono13
    float: $p.mono17
    glob: $p.mono18
    int: $p.mono15
    list: $p.mono20
    nothing: $p.mono13
    range: $p.acc02
    record: $p.mono20
    string: $p.mono15

    bool: {|| if $in { $p.mono17 } else { $p.orange00 } }

    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: $p.mono21 attr: b }
        } else if $in < 6hr {
            $p.mono21
        } else if $in < 1day {
            $p.mono19
        } else if $in < 3day {
            $p.mono17
        } else if $in < 1wk {
            { fg: $p.mono15 attr: b }
        } else if $in < 6wk {
            $p.mono13
        } else if $in < 52wk {
            $p.mono11
        } else { $p.mono09 }
    }

    filesize: {|e|
        if $e == 0b {
            { fg: $p.mono13 attr: s }
        } else if $e < 1mb {
            $p.mono17
        } else {{ fg: $p.mono20 }}
    }

    shape_and: { fg: $p.mono19 attr: b }
    shape_binary: { fg: $p.mono19 attr: b }
    shape_block: { fg: $p.mono17 attr: b }
    shape_bool: $p.mono17
    shape_closure: { fg: $p.mono20 attr: b }
    shape_custom: $p.acc05
    shape_datetime: { fg: $p.mono16 }
    shape_directory: $p.mono18
    shape_external: { fg: $p.mono20 attr: i }
    shape_external_resolved: { fg: $p.mono22 attr: b }
    shape_externalarg: $p.mono16
    shape_filepath: $p.mono18
    shape_flag: { fg: $p.mono16 attr: b }
    shape_float: { fg: $p.mono17 }
    shape_garbage: { fg: $p.mono13 attr: biu }
    shape_glob_interpolation: { fg: $p.mono18 attr: b }
    shape_globpattern: { fg: $p.mono18 attr: b }
    shape_int: { fg: $p.mono15 }
    shape_internalcall: { fg: $p.mono22 attr: b }
    shape_keyword: { fg: $p.mono19 attr: b }
    shape_list: { fg: $p.mono20 }
    shape_literal: $p.mono17
    shape_match_pattern: $p.mono24
    shape_matching_brackets: { attr: u }
    shape_nothing: $p.mono13
    shape_operator: $p.acc02
    shape_or: { fg: $p.mono19 attr: b }
    shape_pipe: { fg: $p.mono19 attr: b }
    shape_range: { fg: $p.acc02 attr: b }
    shape_raw_string: { fg: $p.mono22 attr: b }
    shape_record: { fg: $p.mono20 attr: b }
    shape_redirection: { fg: $p.mono19 attr: b }
    shape_signature: { fg: $p.mono24 attr: b }
    shape_string: $p.mono15
    shape_string_interpolation: { fg: $p.mono17 attr: b }
    shape_table: { fg: $p.mono17 attr: b }
    shape_vardecl: { fg: $p.mono17 attr: u }
    shape_variable: { fg: $p.mono19 attr: ui }

    foreground: $p.mono16
    background: $p.mono02
    cursor: $p.mono17

    empty: $p.mono07
    header: { fg: $p.mono24 attr: b }
    hints: { fg: $p.mono09 attr: i }
    leading_trailing_space_bg: { attr: n }
    row_index: { fg: $p.mono22 attr: b }
    search_result: { fg: $p.mono17 bg: $p.mono10 attr: b }
    separator: $p.mono07
  }
}

# Update the Nushell configuration
# export def --env "set color_config" [] {
#   $env.config.color_config = (main)
# }

# Update terminal colors
# export def "update terminal" [] {
#   let theme = (main)
# 
#   # Set terminal colors
#   let osc_screen_foreground_color = '10;'
#   let osc_screen_background_color = '11;'
#   let osc_cursor_color = '12;'
#       
#   $"
#   (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
#   (ansi -o $osc_screen_background_color)($theme.background)(char bel)
#   (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
#   "
#   # Line breaks above are just for source readability
#   # but create extra whitespace when activating. Collapse
#   # to one line and print with no-newline
#   | str replace --all "\n" ''
#   | print -n $"($in)\r"
# }

# export module activate {
#   export-env {
#     set color_config
#     update terminal
#   }
# }

# Activate the theme when sourced
# use activate
