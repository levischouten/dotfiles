vim.g.mapleader = " "

local map = vim.keymap.set

-- basic navigation between splits
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- quick splits
map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>s", ":split<CR>")

map("n", "<leader>q", "<cmd>q!<cr>")
map("n", "<leader>a", "<cmd>qa!<cr>")
map("n", "<leader>x", "<cmd>wqa!<cr>")
map("n", "<leader>w", "<cmd>w<cr>")

-- fzf-lua
map("n", "<leader>f", function()
	require("fzf-lua").files()
end)
map("n", "<leader>g", function()
	require("fzf-lua").grep_project()
end)
map("n", "<leader>b", function()
	require("fzf-lua").grep_curbuf()
end)

-- file tree
map("n", "<leader>e", ":NvimTreeToggle<CR>")

vim.keymap.set("i", "<S-CR>", "<Esc>o", { desc = "Insert new line below" })

-- Disable Shift+J from joining lines
vim.keymap.set("n", "J", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "J", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true })

-- Copy diagnostics to clipboard
vim.keymap.set("n", "<leader>cd", function()
	local diags = vim.diagnostic.get(0) -- 0 = current buffer
	local msgs = {}
	for _, d in ipairs(diags) do
		table.insert(
			msgs,
			string.format(
				"%s:%d:%d: %s",
				vim.api.nvim_buf_get_name(0),
				d.lnum + 1, -- 1-based
				d.col + 1,
				d.message
			)
		)
	end
	vim.fn.setreg("+", table.concat(msgs, "\n")) -- copy to system clipboard
	print("Diagnostics copied to clipboard")
end)
