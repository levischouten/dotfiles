return {
	-- UFO (smart folds)
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = { "kevinhwang91/promise-async" },
		opts = {
			open_fold_hl_timeout = 0,
			-- prefer LSP if available; otherwise Treesitter -> indent
			provider_selector = function(_, filetype, _)
				return { "treesitter", "indent" }
			end,
		},
	},
}
