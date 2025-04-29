return {
	"gbprod/substitute.nvim",
	opts = {},
	keys = {
		vim.keymap.set("n", "<leader>s", function()
			require("substitute").operator()
		end, { noremap = true }),
		vim.keymap.set("n", "<leader>ss", function()
			require("substitute").line()
		end, { noremap = true }),
		vim.keymap.set("n", "<leader>S", function()
			require("substitute").eol()
		end, { noremap = true }),
		vim.keymap.set("x", "<leader>s", function()
			require("substitute").visual()
		end, { noremap = true }),
	},
}
