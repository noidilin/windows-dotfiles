return {
  { "tpope/vim-repeat" }, { 'rktjmp/lush.nvim' },

  -- yanky highlight time
  -- { "gbprod/yanky.nvim", opts = { highlight = { timer = 150 }, }, },

  -- mini-move
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<M-Left>',
        right = '<M-Right>',
        down = '<M-Down>',
        up = '<M-Up>',
        -- Move current line in Normal mode
        line_left = '<M-Left>',
        line_right = '<M-Right>',
        line_down = '<M-Down>',
        line_up = '<M-Up>',
      },
    }
  }
}
