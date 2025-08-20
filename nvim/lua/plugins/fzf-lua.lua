return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons", { "junegunn/fzf", build = "./install --bin" } },
		lazy = false,
		config = function()
			require("fzf-lua").setup({
				hls = {
					normal = "NormalFloat",
					border = "FloatBorder",
					title = "Title",
					preview_normal = "NormalFloat",
					preview_border = "FloatBorder",
					preview_title = "Title",
					help_normal = "NormalFloat",
					help_border = "FloatBorder",
					cursor = "Cursor",
					cursorline = "CursorLine",
					search = "Search",
				},
				winopts = {
					border = "rounded",
					backdrop = false,
				},
				grep = {
					no_header_i = true,
					no_header = true,
				},
				grep_curbuf = {
					no_header_i = true,
					no_header = true,
				},
				buffers = {
					no_header_i = true,
					no_header = true,
				},
			})
		end,
	},
}
