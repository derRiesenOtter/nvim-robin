return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', '<leader>gj', function()
        if vim.wo.diff then
          vim.cmd.normal({ '<leader>gj', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end, { desc = "Next Hunk" })

      map('n', '<leader>gk', function()
        if vim.wo.diff then
          vim.cmd.normal({ '<leader>gk', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end, { desc = "Previous Hunk" })

      -- Actions
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = "Stage Hunk" })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = "Reset Hunk" })

      map('v', '<leader>gs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = "Stage Hunk" })

      map('v', '<leader>gr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = "Reset Hunk" })

      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = "Stage Buffer" })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = "Reset Buffer" })
      map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = "Previe Hunk" })

      map('n', '<leader>gb', function()
        gitsigns.blame_line({ full = true })
      end, { desc = "Blame Line" })

      map('n', '<leader>gc', gitsigns.diffthis, { desc = "Diff" })

      map('n', '<leader>gC', function()
        gitsigns.diffthis('~')
      end, { desc = "Diff" })

      -- map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
      -- map('n', '<leader>hq', gitsigns.setqflist)

      -- Toggles
      map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
      map('n', '<leader>gtd', gitsigns.toggle_deleted, { desc = "Toggle Deleted" })
      map('n', '<leader>gtw', gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })

      -- Text object
      map({ 'o', 'x' }, 'gh', gitsigns.select_hunk, { desc = "Select Hunk" })
    end
  },
}
