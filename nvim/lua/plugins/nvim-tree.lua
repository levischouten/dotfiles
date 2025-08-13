return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = { width = 40, side = "left" },
				update_focused_file = { enable = true },
				filters = { dotfiles = false },
				renderer = {
					highlight_git = true,
					icons = {
						show = {
							folder = false,
						},
					},
				},
			})
		end,
	},
}
