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
      r_language_server = {},
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

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>cc", vim.lsp.buf.rename, opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>ct", vim.diagnostic.open_float, opts)
      end,
    })
  end,

}
