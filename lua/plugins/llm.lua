return {
  {
    "Kurama622/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    config = function()
      local tools = require("llm.tools")
      require("llm").setup({
        -- [[ local llm ]]
        url = "http://localhost:11434/api/chat",
        model = "qwen2.5-coder:14b",
        api_type = "ollama",
        temperature = 0.3,
        top_p = 0.7,

        prompt = "You are a helpful english assistant.",

        prefix = {
          user = { text = "🚴🏽‍♂️ ", hl = "Title" },
          assistant = { text = "  ", hl = "Added" },
        },

        -- history_path = "/tmp/llm-history",
        save_session = true,
        max_history = 15,
        max_history_name_length = 20,

        -- stylua: ignore
        keys = {
          -- The keyboard mapping for the input window.
          ["Input:Submit"]      = { mode = "n", key = "<cr>" },
          ["Input:Cancel"]      = { mode = { "n", "i" }, key = "<C-c>" },
          ["Input:Resend"]      = { mode = { "n", "i" }, key = "<C-r>" },

          -- only works when "save_session = true"
          ["Input:HistoryNext"] = { mode = { "n", "i" }, key = "<C-j>" },
          ["Input:HistoryPrev"] = { mode = { "n", "i" }, key = "<C-k>" },

          -- The keyboard mapping for the output window in "split" style.
          ["Output:Ask"]        = { mode = "n", key = "i" },
          ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
          ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

          -- The keyboard mapping for the output and input windows in "float" style.
          ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
          ["Session:Close"]     = { mode = "n", key = { "<esc>", "Q" } },
        },
        display = {
          diff = {
            layout = "vertical",    -- vertical|horizontal split for default provider
            opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
            provider = "mini_diff", -- default|mini_diff
          },
        },
        app_handler = {
          CodeExplain = {
            handler = tools.flexi_handler,
            prompt = "Explain the following code, please only return the explanation",
            opts = {
              enter_flexible_window = true,
            },
          },
          OptimizeCode = {
            handler = tools.side_by_side_handler,
            prompt =
            "Optimize the following code and find errors, please only return the optimized code (not as markdown)",
            opts = {
              left = {
                focusable = false,
              },
            },
          },
          CommitMsg = {
            handler = tools.flexi_handler,
            prompt = function()
              return string.format(
                [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

1. First line: conventional commit format (type: concise description) (remember to use semantic types like feat, fix, docs, style, refactor, perf, test, chore, etc.)
2. Optional bullet points if more context helps:
   - Keep the second line blank
   - Keep them short and direct
   - Focus on what changed
   - Always be terse
   - Don't overly explain
   - Drop any fluffy or formal language

Return ONLY the commit message - no introduction, no explanation, no quotes around it.

Examples:
feat: add user auth system

- Add JWT tokens for API auth
- Handle token refresh for long sessions

fix: resolve memory leak in worker pool

- Clean up idle connections
- Add timeout for stale workers

Simple change example:
fix: typo in README.md

Very important: Do not respond with any of the examples. Your message must be based off the diff that is about to be provided, with a little bit of styling informed by the recent commits you're about to see.

Based on this format, generate appropriate commit messages. Respond with message only. DO NOT format the message in Markdown code blocks, DO NOT use backticks:

```diff
%s
```
]],
                vim.fn.system("git diff --no-ext-diff --staged")
              )
            end,
          },
          TestCode = {
            handler = tools.side_by_side_handler,
            prompt = [[ Write some test cases for the following code, only return the test cases.
            Give the code content directly, do not use code blocks or other tags to wrap it. ]],
            opts = {
              right = {
                title = " Test Cases ",
              },
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>",           desc = "Chat" },
      { "<leader>ae", mode = "v", "<cmd>LLMAppHandler CodeExplain<cr>",  desc = "Explain Code" },
      { "<leader>ao", mode = "v", "<cmd>LLMAppHandler OptimizeCode<cr>", desc = "Optimize Code" },
      { "<leader>at", mode = "v", "<cmd>LLMAppHandler TestCode<cr>",     desc = "Test Code" },
      { "<leader>ag", mode = "n", "<cmd>LLMAppHandler CommitMsg<cr>",    desc = "Create Git Commit Message" },
    },
  },
}
