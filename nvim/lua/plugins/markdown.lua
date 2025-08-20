return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			enabled = true,
			max_file_size = 5.0,
			heading = {
				enabled = false,
			},
			code = {
				enabled = true,
				sign = false,
				style = "normal",
				width = "full",
			},
			dash = {
				enabled = false,
			},
			bullet = {
				enabled = false,
			},
			checkbox = {
				enabled = true,
				unchecked = { icon = "☐ " },
				checked = { icon = "☑ " },
			},
			quote = {
				enabled = false,
			},
			pipe_table = {
				enabled = true,
				style = "normal",
			},
			sign = {
				enabled = false,
			},
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
