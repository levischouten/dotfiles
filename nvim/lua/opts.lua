local o = vim.opt

o.number = true
o.relativenumber = true
o.mouse = "a"
o.signcolumn = "yes"
o.termguicolors = true
o.updatetime = 200
o.clipboard = "unnamedplus"
o.wrap = false

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.incsearch = false
o.hlsearch = false

-- Code folding
o.foldcolumn = "0"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- splits
o.splitright = true
o.splitbelow = true

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})
