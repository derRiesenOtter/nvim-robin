return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"r_language_server",
				"marksman",
				"rust_analyzer",
				"tinymist",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").lua_ls.setup({})
			require("lspconfig").pyright.setup({})
			require("lspconfig").r_language_server.setup({})
			require("lspconfig").marksman.setup({})
			-- require("lspconfig").rust_analyzer.setup({})
			require("lspconfig").tinymist.setup({})
		end,
	},
}
