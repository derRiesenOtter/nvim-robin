return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = true },
		git = { enabled = true },
		lazygit = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },
		-- image = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = true },
	},
	keys = {
		-- picker
		-- files
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ cwd = Snacks.git.get_root() })
			end,
			desc = "Find Files (Root)",
		},
		{
			"<leader>fF",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files (CWD)",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- grep
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		--- lsp
		{
			"glD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"gld",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"glr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "Goto References",
		},
		{
			"gli",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},

		-- explorer
		{
			"<leader>e",
			function()
				Snacks.explorer.open()
			end,
			desc = "Explorer",
		},

		-- git
		{
			"<leader>gl",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Blame Line",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gw",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Gitbrowse",
		},

		-- terminal
		{
			"<leader>t",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Terminal",
		},
	},
}
