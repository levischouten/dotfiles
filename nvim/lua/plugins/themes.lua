return {
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
					terminal_colors = true,
					darken = {
						sidebars = { enable = true, list = { "NvimTree" } },
					},
				},
			})
		end,
	},

	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.sonokai_style = "maia"
			vim.g.sonokai_transparent_background = 2
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_enable_italic = 1
		end,
		config = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("sonokai")
		end,
	},

	{
		"f-person/auto-dark-mode.nvim",
		config = function()
			local function apply_theme_overrides()
				vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

				if vim.o.background == "dark" then
					-- dark mode
				else
					-- light mode
					vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ebebeb", bg = "NONE" })
				end
			end

			-- also apply whenever colorscheme changes
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = apply_theme_overrides,
			})

			local adm = require("auto-dark-mode")
			adm.setup({
				set_dark_mode = function()
					vim.o.background = "dark"
					vim.cmd.colorscheme("sonokai")
					vim.schedule(apply_theme_overrides)
				end,
				set_light_mode = function()
					vim.o.background = "light"
					vim.cmd.colorscheme("github_light")
					vim.schedule(apply_theme_overrides)
				end,
			})
			adm.init()

			-- run once on startup too
			apply_theme_overrides()
		end,
	},
}
