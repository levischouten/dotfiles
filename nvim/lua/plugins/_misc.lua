return {
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},

	{ "christoomey/vim-tmux-navigator", lazy = false },

	-- LSP
	{ "neovim/nvim-lspconfig" },
}
