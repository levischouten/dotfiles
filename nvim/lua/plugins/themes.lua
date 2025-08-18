return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				float = {
					transparent = true,
					solid = false,
				},
			})

			-- FZF Lua
			vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FzfLuaBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { bg = "NONE" })

			-- Lazygit / floating terminal background
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

			-- UFO Code Folding TODO: FIX
			vim.api.nvim_set_hl(0, "UfoFoldedBg", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", { bg = "NONE", fg = "NONE" })

			-- MultiCursor
			vim.api.nvim_set_hl(0, "MultiCursor", { link = "Visual" })
			vim.api.nvim_set_hl(0, "MultiCursorMain", { link = "Visual" })

			vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},
}
