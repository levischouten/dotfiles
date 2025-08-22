local lspconfig = require("lspconfig")

-- diagnostics look tidy
vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = " " },
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- common on_attach and capabilities
local on_attach = function(_, bufnr)
	local map = function(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
	end
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gr", function()
		require("snacks.picker").lsp_references()
	end)
	map("n", "K", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end)
	map("n", "<leader>r", vim.lsp.buf.rename)

	map("n", "<leader>c", function()
		require("snacks.picker").code_actions()
	end)

	map("n", "<leader>D", function()
		require("snacks.picker").diagnostics()
	end)
	map("n", "<leader>d", function()
		vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
	end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Go
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- TypeScript / TSX
lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- TailwindCSS
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"html",
		"css",
		"scss",
		"typescript",
		"typescriptreact",
	},
})

-- Lua (just to make editing config nicer)
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
})

-- C/C++
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = (function()
		local c = vim.deepcopy(capabilities)
		-- clangd prefers utf-16 offsets; keep this per-server
		c.offsetEncoding = { "utf-16" }
		return c
	end)(),
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--fallback-style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
	},
})

-- CMake files
lspconfig.cmake.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Markdown
lspconfig.marksman.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	-- filetypes = { "markdown" },
	-- root_dir = util.root_pattern(".git", ".marksman.toml", "marksman.toml", "README.md"),
})
