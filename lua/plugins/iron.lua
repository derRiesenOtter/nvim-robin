return {
  "Vigemus/iron.nvim",
  config = function()
    iron = require("iron.core")
    view = require("iron.view")
    common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          sh = {
            command = { "bash" },
          },
          python = {
            command = { "python3" },
            format = common.bracketed_paste_python,
            block_deviders = { "# %%", "#%%" },
          },
        },
        repl_filetype = function(bufnr, ft)
          return ft
        end,
        repl_open_cmd = view.right(80),
      },
      keymaps = {
        toggle_repl = "<localleader>r",
        restart_repl = "<localleader>R",
        visual_send = "<localleader>s",
        send_file = "<localleader>f",
        send_line = "<localleader>s",
        send_paragraph = "<localleader>b",
        send_until_cursor = "<localleader>u",
        cr = "<localleader><cr>",
        interrupt = "<localleader><space>",
        exit = "<localleader>q",
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })
  end,
}
