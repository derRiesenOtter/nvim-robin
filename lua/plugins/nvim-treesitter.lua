return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"lua",
			"markdown",
			"python",
			"r",
			"rust",
		},
		auto_install = true,

		additional_vim_regex_highlighting = false,
	},
}
