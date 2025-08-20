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
			-- Smart toggle: focus left sidebar if open, close if floating, otherwise open floating
			{
				"<leader>e",
				function()
					local manager = require("neo-tree.sources.manager")
					local state = manager.get_state("filesystem")
					local current_win = vim.api.nvim_get_current_win()

					-- Check if left sidebar is open
					if state.winid and vim.api.nvim_win_is_valid(state.winid) then
						local win_config = vim.api.nvim_win_get_config(state.winid)
						if win_config.relative == "" then
							-- Left sidebar is open
							if current_win == state.winid then
								-- We're already in the sidebar, go back to previous window
								vim.cmd("wincmd p")
							else
								-- Focus the sidebar
								vim.api.nvim_set_current_win(state.winid)
							end
							return
						end
					end

					-- Check if we're currently in a floating Neotree window
					local current_buf = vim.api.nvim_win_get_buf(current_win)
					local buf_name = vim.api.nvim_buf_get_name(current_buf)

					if string.match(buf_name, "neo%-tree") then
						local win_config = vim.api.nvim_win_get_config(current_win)
						if win_config.relative ~= "" then
							-- We're in a floating Neotree, close it
							vim.cmd("Neotree close")
							return
						end
					end

					-- No sidebar open and not in floating, open floating window
					vim.cmd("Neotree toggle float reveal")
				end,
				desc = "Explorer Smart Toggle",
			},
		},
	},
}
