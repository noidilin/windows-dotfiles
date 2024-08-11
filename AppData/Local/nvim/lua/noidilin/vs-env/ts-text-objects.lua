return { -- Navigate code with Treesitter
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- vscode won't load up nvim-treesitter-textobjects with lazy set to true
  -- lazy = true,

  config = function()
    -- note that it is requiring "nvim-treesitter.configs"
    require("nvim-treesitter.configs").setup({
      textobjects = {
        --[[ select = {
          enable = true,
          lookahead = true,   -- automatically jump forward to textobj, similar to targets.vim

          keymaps = {         -- you can use the capture groups defined in textobjects.scm
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

            -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
            ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
            ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
            ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
            ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

            ["ai"] = { query = "@call.outer", desc = "Select outer part of a function call" },
            ["ii"] = { query = "@call.inner", desc = "Select inner part of a function call" },

            ["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
          },
        }, ]]
        swap = {
          enable = true,
          -- swap (param/arg), (prop), (func) with next
          swap_next = { ["<leader>na"] = "@parameter.inner", ["<leader>nr"] = "@property.outer", ["<leader>nf"] = "@function.outer", },
          -- swap (param/arg), (prop), (func) with prev
          swap_previous = { ["<leader>pa"] = "@parameter.inner", ["<leader>pr"] = "@property.outer", ["<leader>pf"] = "@function.outer", },
        },
        move = {
          enable = true,
          -- set_jumps = true, -- whether to set jumps in the jumplist

          -- [[ Query group ]]
          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },

          -- [ "iI", "@conditional.outer" ], [ "lL", "@loop.outer" ]
          goto_next_start = { ["]a"] = "@parameter.outer", ["]i"] = "@call.outer", ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]r"] = "@property.outer", },
          goto_next_end = { ["]A"] = "@parameter.outer", ["]I"] = "@call.outer", ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]R"] = "@property.outer", },
          goto_previous_start = { ["[a"] = "@parameter.outer", ["[i"] = "@call.outer", ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[r"] = "@property.outer", },
          goto_previous_end = { ["[A"] = "@parameter.outer", ["[I"] = "@call.outer", ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[R"] = "@property.outer", },
        },
      },
    })

    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

    -- vim way: ; goes to the direction you were moving.
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    -- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
    -- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
    -- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
    -- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
  end,
}
