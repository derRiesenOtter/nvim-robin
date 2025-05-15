return {
	"jeangiraldoo/codedocs.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<localleader>d",
			function()
				require("codedocs").insert_docs()
			end,
			desc = "Insert docstring",
		},
	},
}
