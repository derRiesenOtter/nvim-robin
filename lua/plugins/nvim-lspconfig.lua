return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},

	opts = {
		servers = {
			lua_ls = {},
			pyright = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		local blink_cmp = require("blink.cmp")

		local keymap = vim.keymap

		for server, config in pairs(opts.servers) do
			config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end

		keymap.set("n", "gd", function()
			require("fzf-lua").lsp_definitions()
		end, { desc = "Show LSP definitions" })

		keymap.set("n", "<leader>D", function()
			require("fzf-lua").diagnostics_document()
		end, { desc = "Show document diagnostics" })

		keymap.set("n", "gi", function()
			require("fzf-lua").lsp_implementations()
		end, { desc = "Show LSP implementations" })

		keymap.set("n", "<leader>ca", function()
			require("fzf-lua").lsp_code_actions()
		end, { desc = "Show code actions" })

		keymap.set("n", "gr", function()
			require("fzf-lua").lsp_references()
		end, { desc = "Show LSP references" })

		keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Smart rename" })

		keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

		keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

		keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

		keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })

		keymap.set({ "n", "v", "i", "c" }, "<C-k>", vim.lsp.buf.hover, { desc = "Show documentation" })
	end,
}

-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(ev)
-- 	config = function()
-- 		local lspconfig = require("lspconfig")
--
-- 		local keymap = vim.keymap
--
-- 				local opts = { buffer = ev.buf, silent = true }
--
--
--
--
--
--
-- 				opts.desc = "Restart LSP"
-- 				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
-- 			end,
-- 		})
--
-- 		local capabilities = cmp_nvim_lsp.default_capabilities()
--
-- 		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
-- 		for type, icon in pairs(signs) do
-- 			local hl = "DiagnosticSign" .. type
-- 			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- 		end
--
-- 		mason_lspconfig.setup_handlers({
-- 			function(server_name)
-- 				lspconfig[server_name].setup({
-- 					capabilities = capabilities,
-- 				})
-- 			end,
-- 			["lua_ls"] = function()
-- 				-- configure lua server (with special settings)
-- 				lspconfig["lua_ls"].setup({
-- 					capabilities = capabilities,
-- 					settings = {
-- 						Lua = {
-- 							-- make the language server recognize "vim" global
-- 							diagnostics = {
-- 								globals = { "vim" },
-- 							},
-- 							completion = {
-- 								callSnippet = "Replace",
-- 							},
-- 						},
-- 					},
-- 				})
-- 			end,
-- 		})
-- 	end,
-- }
