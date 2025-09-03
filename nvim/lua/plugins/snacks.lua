return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
		},
		opts = {
			styles = {
				lazygit = {
					backdrop = false,
					wo = {
						winblend = 0,
					},
				},
			},
			scroll = {
				enabled = true,

				animate = {
					-- small per-step + modest total keeps it snappy
					duration = { step = 6, total = 80 },
					easing = "linear",
					fps = 120,
				},
				-- if the next scroll happens quickly, use an even faster animation
				animate_repeat = {
					delay = 60, -- ms since last scroll to count as "repeat"
					duration = { step = 2, total = 18 },
					easing = "linear",
				},
			},
			lazygit = {
				enabled = true,
			},
			picker = {
				enabled = true,
				input = {
					mode = "default",
					quit_on_leave = true,
				},
				layout = "select",
			},
		},
	},
}
