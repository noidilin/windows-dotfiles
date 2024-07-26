return {
  { "rebelot/kanagawa.nvim" }, { "aktersnurra/no-clown-fiesta.nvim" }, { "vague2k/vague.nvim" }, { "sho-87/kanagawa-paper.nvim" },
  {
    "slugbyte/lackluster.nvim",
    opts = {
      tweak_syntax = { comment = '#555555', keyword = '#878787' },
      tweak_background = { normal = '#191919', telescope = '#1e1e1e', menu = '#242424', popup = '#1e1e1e' }
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {},
  },


  -- catppuccin theme
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      color_overrides = {
        all = {
          rosewater = "#ddac89",
          flamingo = "#ad7c58",
          pink = "#8c8cbd",
          mauve = "#5f5f87",
          red = "#af5f5f",
          maroon = "#de7878",
          peach = "#b09661",
          yellow = "#e0bf7b",
          green = "#5f875f",
          teal = "#87af87",
          sky = "#79b8b8",
          sapphire = "#5f8787",
          blue = "#5f87af",
          lavender = "#8fafd7",
          text = "#b3b3b3",
          subtext1 = "#9d9d9d",
          subtext0 = "#878787",
          overlay2 = "#707070",
          overlay1 = "#5d5d5d",
          overlay0 = "#4e4e4e",
          surface2 = "#414141",
          surface1 = "#353535",
          surface0 = "#2a2a2a",
          base = "#1e1e1e",
          mantle = "#191919",
          crust = "#151515",
        },
      },
      custom_highlights = function(colors)
        return {
          LineNr = { fg = "#474747" },                 -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
          LineNrAbove = { fg = "#474747" },            -- Line number for when the 'relativenumber' option is set, above the cursor line
          LineNrBelow = { fg = "#474747" },            -- Line number for when the 'relativenumber' option is set, below the cursor line
          CursorLineNr = { fg = "#707070" },           -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
          Normal = { fg = "#b3b3b3", bg = "#191919" }, -- Normal text
          -- Syntax
          --[[ example: catppuccin syntax customization
          ["@variable"] = { fg = "#878787" },
          ["@namespace"] = { fg = "#eaeaea", style = { "underline" } },
          ["@lsp.type.variable"] = { fg = "#878787" },
          ["@lsp.type.namespace"] = { fg = "#eaeaea", style = { "underline" } },
          ["@lsp.type.unresolvedReference"] = { sp = colors.surface2, style = { "undercurl" } },
          ["@lsp.typemod.variable.static"] = { style = { "underdashed" } },
          ["@lsp.typemod.variable.callable"] = { fg = colors.teal },
          ]]
        }
      end,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lackluster-hack", -- from lackluster.nvim
      -- colorscheme = "no-clown-fiesta" -- from no-clown-fiesta.nvim
      -- colorscheme = "kanagawa-dragon", -- from kanagawa.nvim

      -- these two looks purpleish
      -- colorscheme = "vague" -- from vague.nvim
      -- colorscheme = "kanagawa-paper", -- from kanagawa-paper.nvim

      -- used for customize colorscheme
      -- colorscheme = "catppuccin", -- from catppuccin
    },
  },
}
