return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {

  },
  keys = {
    { "<leader>ha", function() require("harpoon.mark").add_file() end,        desc = "Harpoon Add" },
    { "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon Menu" },
    { "<leader>h1", function() require("harpoon.ui").nav_file(1) end,         desc = "Navigate to 1" },
    { "<leader>h2", function() require("harpoon.ui").nav_file(2) end,         desc = "Navigate to 2" },
    { "<leader>h3", function() require("harpoon.ui").nav_file(3) end,         desc = "Navigate to 3" },
    { "<leader>h4", function() require("harpoon.ui").nav_file(4) end,         desc = "Navigate to 4" },
    { "<leader>h5", function() require("harpoon.ui").nav_file(5) end,         desc = "Navigate to 5" },
    { "<leader>hn", function() require("harpoon.ui").nav_next() end,          desc = "Navigate Next" },
    { "<leader>hp", function() require("harpoon.ui").nav_prev() end,          desc = "Navigate Prev" },
    { "<leader>ht", function() require("harpoon.term").gotoTerminal(1) end,   desc = "Navigate Terminal" },
  }
}
