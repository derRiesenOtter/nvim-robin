return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		spec = {
			-- groups
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>d", group = "Debug" },
			{ "gl", group = "LSP" },
			-- hidden
			{ "gt", hidden = true },
			{ "gT", hidden = true },
			{ "g,", hidden = true },
			{ "g;", hidden = true },
			{ "g`", hidden = true },
			{ "g'", hidden = true },
			{ "g%", hidden = true },
			{ "gO", hidden = true },
			{ "g~", hidden = true },
			{ "gn", hidden = true },
			{ "gN", hidden = true },
			{ "gr", hidden = true },
		},
	},
}
