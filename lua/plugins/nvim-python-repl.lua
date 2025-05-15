return {
	"geg2102/nvim-python-repl",
	dependencies = "nvim-treesitter",
	ft = { "python", "lua", "scala" },
	config = function()
		require("nvim-python-repl").setup({
			execute_on_send = true,
			vsplit = true,
			vim.keymap.set("n", "<localleader>s", function()
				require("nvim-python-repl").send_statement_definition()
			end, { desc = "Send semantic unit to REPL" }),

			vim.keymap.set("v", "<localleader>s", function()
				require("nvim-python-repl").send_visual_to_repl()
			end, { desc = "Send visual selection to REPL" }),

			vim.keymap.set("n", "<localleader>a", function()
				require("nvim-python-repl").send_buffer_to_repl()
			end, { desc = "Send entire buffer to REPL" }),
		})
	end,
}
