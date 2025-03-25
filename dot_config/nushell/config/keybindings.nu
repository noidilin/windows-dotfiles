export def main [] {
  return [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [vi_normal vi_insert]
      event: { send: menu name: completion_menu }
    }
    # ISSUE: space key can't trigger correctly in windows wezterm
    # {
    #   name: ide_completion_menu
    #   modifier: control
    #   keycode: space
    #   mode: [vi_normal vi_insert]
    #   event: { send: menu name: ide_completion_menu }
    # }
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

    # ISSUE: not working
    # {
    #   name: reload_config
    #   modifier: none
    #   keycode: f8
    #   mode: [vi_normal vi_insert]
    #   event: [
    #     {
    #       send: executehostcommand,
    #       cmd: $"clear;source '($nu.env-path)';source '($nu.config-path)';"
    #     }
    #   ]
    # }

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
      name: fzf_files
      modifier: control
      keycode: char_t
      mode: [vi_normal, vi_insert]
      event: {
        send: executehostcommand
        cmd: "
          let fzf_ctrl_t_command = \$\"($env.FZF_CTRL_T_COMMAND) | fzf ($env.FZF_CTRL_T_OPTS)\";
          let result = nu -l -i -c $fzf_ctrl_t_command;
          commandline edit --append $result;
          commandline set-cursor --end
        "
      }
    }
    # {
    #   name: fzf_files
    #   modifier: control
    #   keycode: char_t
    #   mode: [vi_normal vi_insert]
    #   event: {
    #     send: ExecuteHostCommand
    #     cmd: "
    #       commandline edit --insert (
    #         fd --hidden --strip-cwd-prefix --exclude .git
    #           | lines
    #           | str join (char -i 0)
    #           | fzf
    #             --multi
    #             --scheme=path
    #             --read0
    #             --layout=reverse
    #             --height=80%
    #             --bind=change:top
    #           | decode utf-8
    #           | lines
    #           | str join ' '
    #       )
    #     "
    #   }
    # }
    {
        name: fzf_dirs
        modifier: alt
        keycode: char_c
        mode: [emacs, vi_normal, vi_insert]
        event: {
          send: executehostcommand
          cmd: "
            let fzf_alt_c_command = \$\"($env.FZF_ALT_C_COMMAND) | fzf ($env.FZF_ALT_C_OPTS)\";
            let result = nu -c $fzf_alt_c_command;
            cd $result;
          "
        }
    }

    # menu - nushell
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

    # add undo and redo
    # {
    #   name: undo_change
    #   modifier: control
    #   keycode: char_z
    #   mode: [vi_normal vi_insert]
    #   event: { edit: undo }
    # }
    # {
    #   name: redo_change
    #   modifier: control_shift
    #   keycode: char_z
    #   mode: [vi_normal vi_insert]
    #   event: { edit: redo }
    # }

    # disable default
    {
      name: clear_screen
      modifier: control
      keycode: char_l
      mode: [emacs, vi_normal, vi_insert]
      event: null
    }
  ]
}
