return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		lazy = false,
		opts = {
			window = {
				mappings = {
					["<C-v>"] = "open_vsplit", -- vertical split
					["<C-s>"] = "open_split", -- horizontal split
				},
			},
			filesystem = {
				follow_current_file = { enabled = true },
				filtered_items = { visible = false, hide_dotfiles = false },
			},
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
				indent = {
					with_markers = false,
				},
				git_status = {
					symbols = {
						added = "+",
						deleted = "×",
						modified = "•",
						renamed = "→",

						untracked = "?",
						ignored = "",
						unstaged = "!",
						staged = "✓",
						conflict = "≠",
					},
				},
			},
		},
		keys = {
			-- Pin to side
			{
				"<leader>E",
				function()
					vim.cmd("Neotree toggle left reveal")
				end,
				desc = "Explorer Sidebar",
			},
			-- Popup
			{
				"<leader>e",
				function()
					vim.cmd("Neotree toggle float reveal")
				end,
				desc = "Explorer Popup",
			},
		},
	},
}
