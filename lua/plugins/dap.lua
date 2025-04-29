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
	},
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		config = function()
			local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
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
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<leader>ds", dap.terminate, { desc = "Terminate" })

			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Terminate" })
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = { "python", "codelldb" },
		},
	},
}
