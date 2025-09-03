return {
	{
		-- dir = "~/Developer/private/otherhalf",
		"levischouten/otherhalf",
		priority = 1000,
		lazy = false,
		config = function()
			require("otherhalf").setup({
				transparent = true,
				variant = "auto",
			})

			vim.cmd.colorscheme("otherhalf")
		end,
	},
}
