-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_set_hl(0, "YankyYanked", { fg = "#cccccc", bg = "#474747" })
-- vim.api.nvim_set_hl(0, "YankyPut", { fg = "#cccccc", bg = "#474747" })

local hls = {
  -- plugin
  FlashBackdrop = { fg = "#414141" }, -- bg = '#545c7e'
  FlashCurrent = { bg = "#878787", fg = "#151515", bold = true },
  FlashLabel = { fg = "#dad5c8", bold = true },
  FlashMatch = { bg = "#2a2a2a", fg = "#8e8b85", underline = true },
  FlashCursor = { reverse = true },
  YankyYanked = { fg = "#dad5c8", bg = "#474747" },
  YankyPut = { fg = "#dad5c8", bg = "#474747" },
  RenderMarkdownH1 = { fg = "#eaeaea" },
  RenderMarkdownH1Bg = { fg = "#eaeaea" },
  RenderMarkdownH2 = { fg = "#dcdcdc" },
  RenderMarkdownH2Bg = { fg = "#dcdcdc" },
  RenderMarkdownH3 = { fg = "#cccccc" },
  RenderMarkdownH3Bg = { fg = "#cccccc" },
  RenderMarkdownH4 = { fg = "#c0c0c0" },
  RenderMarkdownH4Bg = { fg = "#c0c0c0" },
  RenderMarkdownH5 = { fg = "#b3b3b3" },
  RenderMarkdownH5Bg = { fg = "#b3b3b3" },
  RenderMarkdownH6 = { fg = "#b3b3b3" },
  RenderMarkdownH6Bg = { fg = "#b3b3b3" },
  RenderMarkdownCode = { bg = "#1e1e1e" },
  RenderMarkdownBullet = { fg = "#5d5d5d" },
  RenderMarkdownDash = { fg = "#303030" },
  RenderMarkdownLink = { fg = "#9d9d9d" },
}
for hl_group, hl in pairs(hls) do
  hl.default = true
  vim.api.nvim_set_hl(0, hl_group, hl)
end
