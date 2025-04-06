return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    git = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    image = { enabled = true },
    picker = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    -- files
    { "<leader>ff", function() Snacks.picker.files() end,                desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end,               desc = "Recent" },
    -- grep
    { "<leader>fg", function() Snacks.picker.grep() end,                 desc = "Grep" },
    { "<leader>fw", function() Snacks.picker.grep_word() end,            desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fb", function() Snacks.picker.lines() end,                desc = "Buffer Lines" },
    --- lsp
    { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end,   desc = "Buffer Diagnostics" },
    { "<leader>cd", function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
    { "<leader>cD", function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
    { "<leader>cr", function() Snacks.picker.lsp_references() end,       nowait = true,                     desc = "References" },
    { "<leader>cI", function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
    { "<leader>cy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    -- explorer
    { "<leader>e",  function() Snacks.explorer.open() end,               desc = "Explorer" },
    --git
    { "<leader>gl", function() Snacks.git.blame_line() end,              desc = "Explorer" },
  }
}
