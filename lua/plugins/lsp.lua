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
			require("lspconfig").tinymist.setup({})

			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, { desc = "Code Actions" })

			vim.keymap.set("n", "<leader>rn", function()
				vim.lsp.buf.rename()
			end, { desc = "Smart Rename" })

			vim.keymap.set("n", "gl", function()
				vim.diagnostic.open_float()
			end, { desc = "Show Line Diagnostics" })
		end,
	},
}
