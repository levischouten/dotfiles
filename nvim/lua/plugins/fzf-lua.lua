return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons", { "junegunn/fzf", build = "./install --bin" } },
		lazy = false,
		config = function()
			require("fzf-lua").setup({
				winopts = {
					border = "rounded",
				},
				grep = {
					rg_opts = "--column --line-number --no-heading --color=always --smart-case --fixed-strings",
				},
			})
		end,
	},
}
