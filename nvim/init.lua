-- Fix corrupted homebrew git
vim.env.PATH = "/usr/bin:" .. vim.env.PATH

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=main",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("opts")
require("keymaps")
require("lazy").setup(require("plugins"))
require("lsp")
