return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>fF",
			mode = "n",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>ff",
			mode = "n",
			function()
				require("fzf-lua").git_files()
			end,
		},
		{
			"<leader>fr",
			mode = "n",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Find Recent Files",
		},
		{
			"<leader>fg",
			mode = "n",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find Word",
		},
	},
}
