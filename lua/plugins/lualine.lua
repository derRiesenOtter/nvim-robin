return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "yavorski/lualine-macro-recording.nvim" },
	opts = {
		theme = "gruvbox",
		sections = {
			lualine_c = {
				function()
					local cwd = vim.fn.getcwd()
					local root = vim.fs.root(cwd, { ".git" }) or cwd
					return vim.fn.fnamemodify(root, ":t")
				end,
				"filename",
			},
			lualine_x = { "macro_recording", "filetype" },
		},
	},
}
