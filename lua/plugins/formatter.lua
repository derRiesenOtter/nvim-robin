return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				bash = { "shfmt" },
				lua = { "stylua" },
				python = { "isort", "black" },
				r = { "air" },
				typst = { "prettypst" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		opts = {},
	},
}
