return {
  "hedyhli/markdown-toc.nvim",
  ft = "markdown",
  opts = {
  },
  keys = {
    { "<localleader>t", function() vim.cmd("Mtoc") end, desc = "Create TOC" },

  }
}
