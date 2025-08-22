return {
	{
		dir = "~/Developer/private/otherhalf",
		name = "otherhalf",
		priority = 1000,
		lazy = false,
		config = function()
			require("otherhalf").setup({
				transparent = true,
				variant = "auto",
			})

			-- MultiCursor
			vim.api.nvim_set_hl(0, "MultiCursor", { link = "Visual" })
			vim.api.nvim_set_hl(0, "MultiCursorMain", { link = "Visual" })

			vim.cmd.colorscheme("otherhalf")
		end,
	},
}
