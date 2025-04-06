return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>c", group = "Code" },
      { "<leader>r", group = "Repl" },
      { "<leader>f", group = "Find" },
    },
  },
}
