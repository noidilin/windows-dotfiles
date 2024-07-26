return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-\\>",
					node_incremental = "<C-\\>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
	},
}
