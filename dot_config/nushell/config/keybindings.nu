export def main [] {
  return [
    # align the behavior of tab key.
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [vi_normal vi_insert]
      event: { send: menu name: completion_menu }
    }
    {
      name: completion_previous_menu
      modifier: shift
      keycode: backtab
      mode: [vi_normal vi_insert]
      event: null
    }
    {
      name: ide_completion_menu
      modifier: control
      keycode: space
      mode: [vi_normal vi_insert]
      event: { send: menu name: ide_completion_menu }
    }
    {
      name: complete_suggestion
      modifier: control
      keycode: char_y
      mode: [vi_normal vi_insert]
      event: { send: enter }
    }
    {
      name: submit
      modifier: none
      keycode: enter
      mode: [vi_normal vi_insert]
      event: { send: submit }
    }
    {
      name: next_page
      modifier: control
      keycode: char_f
      mode: [vi_normal vi_insert]
      event: { send: menupagenext }
    }
    {
      name: previous_page
      modifier: control
      keycode: char_b
      mode: [vi_normal vi_insert]
      event: { send: menupageprevious }
    }

    # menu - fzf
    {
      name: history_menu
      modifier: control
      keycode: char_r
      mode: [vi_normal vi_insert]
      event: {
        send: ExecuteHostCommand
        cmd: "commandline edit --replace (
          history
            | get command
            | reverse
            | uniq
            | str join (char -i 0)
            | fzf
              --multi
              --scheme=history
              --read0
              --layout=reverse
              --height=80%
              --bind=change:top
              -q (commandline)
            | decode utf-8
            | str trim
        )"
      }
    }
    {
      name: files
      modifier: control
      keycode: char_t
      mode: [vi_normal vi_insert]
      event: {
        send: ExecuteHostCommand
        cmd: "commandline edit --insert (
          fd --hidden --strip-cwd-prefix --exclude .git
            | lines
            | str join (char -i 0)
            | fzf
              --multi
              --scheme=path
              --read0
              --layout=reverse
              --height=80%
              --bind=change:top
            | decode utf-8
            | lines
            | str join ' '
        )"
      }
    }

    # menu
    {
      name: commands_menu
      modifier: control
      keycode: char_u
      mode: [vi_normal vi_insert]
      event: { send: menu name: commands_menu }
    }
    {
      name: vars_menu
      modifier: control
      keycode: char_v
      mode: [vi_normal vi_insert]
      event: { send: menu name: vars_menu }
    }
    {
      name: help_menu
      modifier: none
      keycode: f9
      mode: [vi_normal vi_insert]
      event: { send: menu name: help_menu }
    }

    # custom keybind
    {
      name: insert_newline
      modifier: shift
      keycode: enter
      mode: [vi_normal vi_insert]
      event: { edit: insertnewline }
    }
    {
      name: reload_config
      modifier: none
      keycode: f5
      mode: [vi_normal vi_insert]
      event: [ 
        {
          send: executehostcommand,
          cmd: $"source '($nu.config-path)'"
        }
        {
          send: executehostcommand,
          cmd: $"print 'config reloaded successfully.'"
        }
      ]
    }

    # change default
    {
      name: redo_change
      modifier: control_shift
      keycode: char_z
      mode: [vi_normal vi_insert]
      event: { edit: redo }
    }
    {
      name: undo_change
      modifier: control
      keycode: char_z
      mode: [vi_normal vi_insert]
      event: { edit: undo }
    }

    # disable default
    {
      name: next_page_menu
      modifier: control
      keycode: char_x
      mode: emacs
      event: null
    }
    {
      name: undo_or_previous_page_menu
      modifier: control
      keycode: char_z
      mode: emacs
      event: null
    }
    {
      name: clear_screen
      modifier: control
      keycode: char_l
      mode: [emacs, vi_normal, vi_insert]
      event: null
    }
    {
      name: search_history
      modifier: control
      keycode: char_q
      mode: [emacs, vi_normal, vi_insert]
      event: null
    }
    {
      name: open_command_editor
      modifier: control
      keycode: char_o
      mode: [emacs, vi_normal, vi_insert]
      event: null
    }
    {
      name: move_to_line_start
      modifier: control
      keycode: char_a
      mode: [emacs, vi_normal, vi_insert]
      event: null
    }
    {
      name: move_to_line_end_or_take_history_hint
      modifier: control
      keycode: char_e
      mode: [emacs, vi_normal, vi_insert]
      event: null
    }
    {
      name: newline_or_run_command
      modifier: none
      keycode: enter
      mode: emacs
      event: null
    }
    {
      name: move_left
      modifier: control
      keycode: char_b
      mode: emacs
      event: null
    }
    {
      name: move_right_or_take_history_hint
      modifier: control
      keycode: char_f
      mode: emacs
      event: null
    }
    {
      name: cut_word_left
      modifier: control
      keycode: char_w
      mode: emacs
      event: null
    }
    {
      name: cut_line_to_end
      modifier: control
      keycode: char_k
      mode: emacs
      event: null
    }
    {
      name: cut_line_from_start
      modifier: control
      keycode: char_u
      mode: emacs
      event: null
    }
    {
      name: swap_graphemes
      modifier: control
      keycode: char_t
      mode: emacs
      event: null
    }
    {
      name: move_one_word_left
      modifier: alt
      keycode: left
      mode: emacs
      event: null
    }
    {
      name: move_one_word_right_or_take_history_hint
      modifier: alt
      keycode: right
      mode: emacs
      event: null
    }
    {
      name: move_one_word_left
      modifier: alt
      keycode: char_b
      mode: emacs
      event: null
    }
    {
      name: move_one_word_right_or_take_history_hint
      modifier: alt
      keycode: char_f
      mode: emacs
      event: null
    }
    {
      name: delete_one_word_forward
      modifier: alt
      keycode: delete
      mode: emacs
      event: null
    }
    {
      name: delete_one_word_backward
      modifier: alt
      keycode: backspace
      mode: emacs
      event: null
    }
    {
      name: delete_one_word_backward
      modifier: alt
      keycode: char_m
      mode: emacs
      event: null
    }
    {
      name: cut_word_to_right
      modifier: alt
      keycode: char_d
      mode: emacs
      event: null
    }
    {
      name: upper_case_word
      modifier: alt
      keycode: char_u
      mode: emacs
      event: null
    }
    {
      name: lower_case_word
      modifier: alt
      keycode: char_l
      mode: emacs
      event: null
    }
    {
      name: capitalize_char
      modifier: alt
      keycode: char_c
      mode: emacs
      event: null
    }
    {
      name: copy_selection
      modifier: control_shift
      keycode: char_c
      mode: emacs
      event: null
    }
    {
      name: cut_selection
      modifier: control_shift
      keycode: char_x
      mode: emacs
      event: null
    }
    {
      name: select_all
      modifier: control_shift
      keycode: char_a
      mode: emacs
      event: null
    }
  ]
}
