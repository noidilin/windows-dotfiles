return {
  "gbprod/yanky.nvim",
  -- event = "LazyFile", -- This won't work in vs code
  opts = { highlight = { timer = 250 }, },
  keys = {
    -- stylua: ignore
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
    -- { "p",  "<Plug>(YankyPutAfter)",   mode = { "n", "x" }, desc = "Put Text After Cursor" },
    -- { "P",  "<Plug>(YankyPutBefore)",  mode = { "n", "x" }, desc = "Put Text Before Cursor" },
    -- { "gp", "<Plug>(YankyGPutAfter)",  mode = { "n", "x" }, desc = "Put Text After Selection" },
    -- { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Selection" },
  },
}
