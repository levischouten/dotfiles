return {
	{
		dir = "~/Developer/private/otherhalf",
		name = "otherhalf",
		priority = 1000,
		lazy = false,
		config = function()
			require("otherhalf").setup({
				transparent = true,
				variant = "auto", -- Automatically detects light/dark mode
			})

			-- MultiCursor
			vim.api.nvim_set_hl(0, "MultiCursor", { link = "Visual" })
			vim.api.nvim_set_hl(0, "MultiCursorMain", { link = "Visual" })

			vim.cmd.colorscheme("otherhalf")
			
			-- Add toggle command
			vim.api.nvim_create_user_command("ToggleTheme", function()
				require("otherhalf").toggle()
			end, { desc = "Toggle between light and dark theme" })
		end,
	},
}
