return {
	{
		"echasnovski/mini.starter",
		version = false,
		dependencies = { "ibhagwan/fzf-lua", "nvim-neo-tree/neo-tree.nvim" },
		config = function()
			local s = require("mini.starter")
			s.setup({
				evaluate_single = true,
				header = "🗂️  Welcome",
				items = {
					{ name = "Files", action = "FzfLua files", section = "Actions" }, -- f
					{ name = "File tree", action = "Neotree float", section = "Actions" }, -- e
					{ name = "Quit", action = "qa", section = "Actions" }, -- q
				},
				footer = "q to quit · e for popup · f for files",
			})
			-- handy single-key mappings on the screen
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniStarterOpened",
				callback = function(ev)
					local buf = ev.buf
					local map = function(k, cmd)
						vim.keymap.set("n", k, "<cmd>" .. cmd .. "<CR>", { buffer = buf, nowait = true })
					end
					map("f", "FzfLua files")
					map("e", "Neotree float")
					map("q", "qa")
				end,
			})
		end,
	},
}
