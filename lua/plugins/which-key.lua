return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>c", group = "Code" },
      { "<leader>r", group = "REPL" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>a", group = "AI" },
      { "<leader>h", group = "Harpoon" },
    },
  },
}
