vim.g.mapleader = " "

local map = vim.keymap.set

-- quick splits
map({ "n", "v" }, "<leader>v", ":vsplit<CR>")
map({ "n", "v" }, "<leader>s", ":split<CR>")

map({ "n", "v" }, "<leader>w", "<cmd>w<cr>")
map({ "n", "v" }, "<leader>q", "<cmd>q!<cr>")
map({ "n", "v" }, "<leader>Q", "<cmd>qa!<cr>")
map({ "n", "v" }, "<leader>x", "<cmd>wqa!<cr>")

map("n", "<leader>f", function()
	require("snacks.picker").files()
end, { desc = "Find Files" })
map("n", "<leader>g", function()
	require("snacks.picker").grep()
end, { desc = "Live Grep" })
map("n", "<leader>F", function()
	require("snacks.picker").buffers()
end, { desc = "Buffers" })
map("n", "<leader>b", function()
	require("snacks.picker").lines({ layout = "select" })
end, { desc = "Grep Current Buffer" })

-- Disable Shift+J from joining lines
vim.keymap.set("n", "J", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "J", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true })
