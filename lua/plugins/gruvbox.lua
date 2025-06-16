return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			overrides = {
				GruvboxRedSign = { fg = "#fb4934", bg = "NONE" },
				GruvboxGreenSign = { fg = "#b8bb26", bg = "NONE" },
				GruvboxYellowSign = { fg = "#fabd2f", bg = "NONE" },
				GruvboxBlueSign = { fg = "#83a598", bg = "NONE" },
				GruvboxPurpleSign = { fg = "#d3869b", bg = "NONE" },
				GruvboxAquaSign = { fg = "#8ec07c", bg = "NONE" },
				GruvboxOrangeSign = { fg = "#fe8019", bg = "NONE" },
			},
		})

		vim.cmd("colorscheme gruvbox")
	end,
}
