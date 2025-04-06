return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    "nvim-lua/plenary.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },

  opts = {
    servers = {
      lua_ls = {},
      pyright = {},
      rust_analyzer = {},
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local blink_cmp = require("blink.cmp")

    for server, config in pairs(opts.servers) do
      config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local keymap = vim.keymap
        local opts = { buffer = ev.buf, silent = true }

        -- opts.desc = "Show LSP definitions"
        -- keymap.set("n", "<leader>cd", function()
        --   require("fzf-lua").lsp_definitions()
        -- end, opts)
        --
        -- opts.desc = "Show document diagnostics"
        -- keymap.set("n", "<leader>cD", function()
        --   require("fzf-lua").diagnostics_document()
        -- end, opts)
        --
        -- opts.desc = "Show LSP implementations"
        -- keymap.set("n", "<leader>ci", function()
        --   require("fzf-lua").lsp_implementations()
        -- end, opts)
        --
        -- opts.desc = "Show code actions"
        -- keymap.set("n", "<leader>ca", function()
        --   require("fzf-lua").lsp_code_actions()
        -- end, opts)
        --
        -- opts.desc = "Show LSP references"
        -- keymap.set("n", "<leader>cr", function()
        --   require("fzf-lua").lsp_references()
        -- end, opts)
        --
        -- opts.desc = "Smart rename"
        -- keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
        --
        -- opts.desc = "Show line diagnostics"
        -- keymap.set("n", "<leader>cm", vim.diagnostic.open_float, opts)
      end,
    })

    -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end
  end,

  -- config = function(_, opts)
  -- 	local lspconfig = require("lspconfig")
  --
  -- 	local blink_cmp = require("blink.cmp")
  --
  -- 	local keymap = vim.keymap
  --
  -- 	for server, config in pairs(opts.servers) do
  -- 		config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
  -- 		lspconfig[server].setup(config)
  -- 	end
  --
  -- 	keymap.set("n", "gd", function()
  -- 		require("fzf-lua").lsp_definitions()
  -- 	end, { desc = "Show LSP definitions" })
  --
  -- 	keymap.set("n", "<leader>D", function()
  -- 		require("fzf-lua").diagnostics_document()
  -- 	end, { desc = "Show document diagnostics" })
  --
  -- 	keymap.set("n", "gi", function()
  -- 		require("fzf-lua").lsp_implementations()
  -- 	end, { desc = "Show LSP implementations" })
  --
  -- 	keymap.set("n", "<leader>ca", function()
  -- 		require("fzf-lua").lsp_code_actions()
  -- 	end, { desc = "Show code actions" })
  --
  -- 	keymap.set("n", "gr", function()
  -- 		require("fzf-lua").lsp_references()
  -- 	end, { desc = "Show LSP references" })
  --
  -- 	keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Smart rename" })
  --
  -- 	keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
  --
  -- 	keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
  --
  -- 	keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
  --
  -- 	keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
  --
  -- 	keymap.set({ "n", "v", "i", "c" }, "<C-k>", vim.lsp.buf.hover, { desc = "Show documentation" })
  --
  -- 	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
  -- 	for type, icon in pairs(signs) do
  -- 		local hl = "DiagnosticSign" .. type
  -- 		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  -- 	end
  -- end,
}

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(ev)
-- 	config = function()
-- 		local lspconfig = require("lspconfig")
--
-- 		local keymap = vim.keymap
--
-- 				local opts = { buffer = ev.buf, silent = true }
