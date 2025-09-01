return {
	-- UFO (smart folds)
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = { "kevinhwang91/promise-async" },
		opts = {
			open_fold_hl_timeout = 0,
			-- prefer LSP if available; otherwise Treesitter -> indent
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		},
		config = function(_, opts)
			local ufo = require("ufo")
			ufo.setup(opts)

			-- Fix for foldlevel issues with zM/zR
			vim.keymap.set("n", "zR", ufo.openAllFolds)
			vim.keymap.set("n", "zM", ufo.closeAllFolds)
		end,
	},
}
