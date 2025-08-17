return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
			show_end_of_buffer = false,
			integrations = {
				treesitter = true,
				native_lsp = { enabled = true },
				cmp = true,
				gitsigns = true,
				which_key = true,
				noice = true,
				mason = true,
				fzf = true,
				neotree = true,
			},
		},
	},

	{
		"f-person/auto-dark-mode.nvim",
		config = function()
			local function apply_theme_overrides()
				-- Fzf-lua
				vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "FzfLuaBorder", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { bg = "NONE" })

				-- Lazygit / floating terminal background
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

				if vim.o.background == "dark" then
					-- dark mode
				else
					-- light mode
					-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ebebeb", bg = "NONE" })
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
					vim.cmd.colorscheme("catppuccin-mocha")
					vim.schedule(apply_theme_overrides)
				end,
				set_light_mode = function()
					vim.o.background = "light"
					vim.cmd.colorscheme("catppuccin-latte")
					vim.schedule(apply_theme_overrides)
				end,
			})
			adm.init()

			-- run once on startup too
			apply_theme_overrides()
		end,
	},
}
