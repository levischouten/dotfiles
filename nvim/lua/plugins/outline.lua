return {
	{
		"stevearc/aerial.nvim",
		opts = {
			backends = { "lsp", "treesitter", "markdown" },
			-- Sidebar (right)
			layout = { default_direction = "prefer_right", placement = "edge", min_width = 28, max_width = 40 },
			-- Popup (centered, focusable, closes on select/esc)
			nav = {
				border = "rounded",
				max_width = 0.6,
				max_height = 0.6,
				close_on_select = true,
				keymaps = { ["<Esc>"] = "actions.close", ["<CR>"] = "actions.jump" },
			},
		},
		keys = {
			-- POPUP
			{
				"<leader>o",
				function()
					require("aerial").nav_open()
				end,
				desc = "Outline popup",
			},
			-- SIDEBAR (right)
			{ "<leader>O", "<cmd>AerialToggle! right<cr>", desc = "Outline sidebar (right)" },
		},
	},
}
