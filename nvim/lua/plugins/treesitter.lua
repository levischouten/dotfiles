return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"go",
					"python",
					"tsx",
					"typescript",
					"javascript",
					"lua",
					"vim",
					"regex",
					"bash",
					"json",
					"yaml",
					"toml",
					"markdown",
					"markdown_inline",
					"c",
					"cpp",
					"cmake",
				},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = { enable = true },
			})
		end,
	},
}
