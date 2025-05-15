return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"mrcjkb/rustaceanvim",
		ft = "rust",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			-- Set up buffer-local keymaps when a Rust file is loaded
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "rust",
				callback = function()
					vim.keymap.set("n", "glR", "<cmd>RustLsp runnables<cr>", { desc = "Runnables" })
					vim.keymap.set("n", "gla", "<cmd>RustLsp codeAction<cr>", { desc = "Code Actions" })
					vim.keymap.set("n", "gll", "<cmd>RustLsp renderDiagnostic<cr>", { desc = "Show Line Diagnostic" })
					vim.keymap.set("n", "gle", "<cmd>RustLsp explainError<cr>", { desc = "Error Explanation" })
				end,
			})
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		config = function()
			local python = vim.fn.expand("~/.local/share/nvim-robin/mason/packages/debugpy/venv/bin/python")
			require("dap-python").setup(python)
		end,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},

	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			dap.defaults.fallback.terminal_win_cmd = "belowright 10split new"

			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<leader>ds", dap.terminate, { desc = "Terminate" })
			vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step Over" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
			vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
			vim.keymap.set("n", "<leader>dd", dap.clear_breakpoints, { desc = "Clear breakpoints" })
			vim.keymap.set("n", "<leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Hover" })
			vim.keymap.set("n", "<leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "Preview" })
			vim.keymap.set("n", "<leader>dr", function()
				require("dap.repl").toggle({ height = 10 })
			end, { desc = "Toggle REPL" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = { "python", "codelldb" },
		},
	},
}
