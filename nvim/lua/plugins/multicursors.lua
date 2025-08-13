return {
	{
		"smoka7/multicursors.nvim",
		dependencies = { "nvimtools/hydra.nvim" },
		opts = {
			hint_config = { position = "bottom-right", float_opts = { border = "rounded" } },
			-- generate_hints = { normal = true, insert = true, extend = true },
		},
		keys = {
			{ "<leader>m", "<cmd>MCstart<cr>", mode = { "v" }, desc = "MultiCursor: start" },
		},
	},
}
