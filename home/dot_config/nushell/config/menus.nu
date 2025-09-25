export def main [] {
  let menu_style = {
    text: "#707070"
    selected_text: { attr: r }
    description_text: { fg: "#5d5d5d" attr: i }
    match_text: { attr: u }
    selected_match_text: { attr: ur }
  }

  return [
    {
      name: completion_menu
      only_buffer_difference: false
      marker: ""
      type: {
        layout: columnar
        columns: 4
        col_width: 20
        col_padding: 2
      }
      style: $menu_style
    }
    {
      name: ide_completion_menu
      only_buffer_difference: false
      marker: ""
      type: {
        layout: ide
        min_completion_width: 0
        max_completion_width: 50
        max_completion_height: 10
        padding: 0
        border: true
        cursor_offset: 0
        description_mode: "prefer_right"
        min_description_width: 0
        max_description_width: 50
        max_description_height: 10
        description_offset: 1
        correct_cursor_pos: false
      }
      style: $menu_style
    }
    {
      name: help_menu
      only_buffer_difference: true
      marker: ""
      type: {
        layout: description
        columns: 4
        col_width: 20
        col_padding: 2
        selection_rows: 4
        description_rows: 10
      }
      style: $menu_style
    }
    {
      name: commands_menu
      only_buffer_difference: false
      marker: ""
      type: {
        layout: columnar
        columns: 4
        col_width: 20
        col_padding: 2
      }
      style: $menu_style
      source: { |buffer, position|
        scope commands
          | where name =~ $buffer
          | each { |it| {value: $it.name description: $it.description} }
      }
    }
    {
      name: vars_menu
      only_buffer_difference: true
      marker: ""
      type: {
        layout: list
        page_size: 10
      }
      style: $menu_style
      source: { |buffer, position|
        scope variables
          | where name =~ $buffer
          | sort-by name
          | each { |it| {value: $it.name description: $it.type} }
      }
    }
  ]
}
