-- Currently this plugin is not being loaded, as I am not sure I like it.
return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = { char = "▏" },
				scope = { enabled = false },
			})
		end,
	},
}
