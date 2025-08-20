return {
	{
		dir = "~/Developer/private/otherhalf",
		name = "otherhalf",
		priority = 1000,
		lazy = false,
		config = function()
			-- Try to detect terminal background
			local function detect_background()
				local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
				if handle then
					local result = handle:read("*a")
					handle:close()
					if result and result:match("Dark") then
						vim.o.background = "dark"
					else
						vim.o.background = "light"
					end
				end
			end
			
			detect_background()
			
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
