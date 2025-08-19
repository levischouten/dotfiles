vim.g.mapleader = " "

local map = vim.keymap.set

-- quick splits
map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>s", ":split<CR>")

map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q!<cr>")
map("n", "<leader>Q", "<cmd>qa!<cr>")
map("n", "<leader>x", "<cmd>wqa!<cr>")

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
map("n", "<leader>B", function()
	require("fzf-lua").buffers()
end)
-- Disable Shift+J from joining lines
vim.keymap.set("n", "J", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "J", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true })
