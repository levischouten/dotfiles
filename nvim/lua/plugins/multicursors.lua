return {
	{
		"mg979/vim-visual-multi",
		branch = "master",
		init = function()
			vim.g.VM_default_mappings = 0
			vim.g.VM_maps = {
				["Find Under"] = "<leader>m",
				["Select All"] = "<leader>M",
				["Add Cursor Down"] = "<M-j>",
				["Add Cursor Up"] = "<M-k>",
			}
		end,
	},
}
