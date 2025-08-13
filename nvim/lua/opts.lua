local o = vim.opt

o.number = true
o.relativenumber = true
o.mouse = "a"
o.signcolumn = "yes"
o.termguicolors = true
o.updatetime = 200
o.clipboard = "unnamedplus"

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true -- convert tabs to spaces
o.smartindent = true

o.incsearch = false
o.hlsearch = false

-- folding via Treesitter, not enabled by default
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()30"
o.foldenable = true
o.foldlevel = 99
o.foldtext = "v:lua.MyFoldText()"

function MyFoldText()
	local line = vim.fn.getline(vim.v.foldstart)
	return line:gsub("^%s+", "")
end

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

-- TODO: get this working
-- it currently breaks because this renders the
-- file tree before the buffer and then when a buffer is entered
-- the styling is overwritten by the ibl plugin again..
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(data)
		-- buffer is a real file on disk
		local is_file = vim.fn.filereadable(data.file) == 1
		-- buffer is a directory
		local is_dir = vim.fn.isdirectory(data.file) == 1

		if not is_file and not is_dir then
			require("nvim-tree.api").tree.open()
		end
	end,
})
