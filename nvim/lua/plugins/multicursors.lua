return {
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = { "nvimtools/hydra.nvim" },
		opts = function()
			local N = require("multicursors.normal_mode")
			return {
				hint_config = false,
				normal_keys = {
					["n"] = { method = N.find_next, opts = { desc = "Next match" } },
					["N"] = { method = N.find_prev, opts = { desc = "Prev match" } },
				},
			}
		end,
		keys = {
			{ "<leader>m", "<cmd>MCstart<CR>", mode = { "v" }, desc = "Multicursor from word/selection" },
		},
	},
}
