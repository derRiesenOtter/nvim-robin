return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "*",

  opts = {
    keymap = { preset = "enter" },

    sources = {
      providers = {
        path = {
          opts = {
            get_cwd = function()
              return vim.fs.root(vim.fn.getcwd(), { ".git" })
            end,
          },
        },
      },
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
