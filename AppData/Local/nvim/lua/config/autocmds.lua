-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_set_hl(0, "YankyYanked", { fg = "#cccccc", bg = "#474747" })

local hls = {
	-- plugin
	FlashBackdrop = { fg = "#414141" },
	FlashCurrent = { bg = "#878787", fg = "#151515", bold = true },
	FlashLabel = { fg = "#dad5c8", bold = true },
	FlashMatch = { bg = "#2a2a2a", fg = "#8e8b85", underline = true },
	FlashCursor = { reverse = true },
	YankyYanked = { fg = "#dad5c8", bg = "#474747" },
	YankyPut = { fg = "#dad5c8", bg = "#474747" },
	-- markdown render - heading
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
	-- markdown render - other element
	RenderMarkdownCode = { bg = "#1e1e1e" },
	RenderMarkdownBullet = { fg = "#5d5d5d" },
	RenderMarkdownDash = { fg = "#303030" },
	RenderMarkdownLink = { fg = "#9d9d9d" },
	-- markdown render - callout
	RenderMarkdownInfo = { fg = "#707070" },
	RenderMarkdownSuccess = { fg = "#778777" },
	RenderMarkdownHint = { fg = "#769494" },
	RenderMarkdownWarn = { fg = "#c8a492" },
	RenderMarkdownError = { fg = "#b07878" },
	RenderMarkdownQuote = { fg = "#8e8b85" },
	-- vague theme
	-- LspReferenceText = { bg = "#414141" },
}

vim.api.nvim_create_autocmd("BufReadPre", {
	group = vim.api.nvim_create_augroup("noidilin_highlights", { clear = true }),
	desc = "Change plugin highlights",
	callback = function()
		for hl_group, hl in pairs(hls) do
			hl.default = true
			vim.api.nvim_set_hl(0, hl_group, hl)
		end
	end,
})
