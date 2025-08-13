return {
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofumpt", "goimports" },
				python = { "ruff_format", "black" }, -- ruff for quick, black for strict
				javascript = { "biome", "prettierd", "prettier" },
				typescript = { "biome", "prettierd", "prettier" },
				javascriptreact = { "biome", "prettierd", "prettier" },
				typescriptreact = { "biome", "prettierd", "prettier" },
				json = { "biome", "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
		},
	},
}
