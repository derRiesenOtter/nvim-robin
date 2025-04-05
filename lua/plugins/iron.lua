return {
	"Vigemus/iron.nvim",
	config = function()
		iron = require("iron.core")
		view = require("iron.view")
		common = require("iron.fts.common")

		iron.setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					sh = {
						command = { "bash" },
					},
					python = {
						command = { "python3" },
						format = common.bracketed_paste_python,
						block_deviders = { "# %%", "#%%" },
					},
				},
				repl_filetype = function(bufnr, ft)
					return ft
				end,
				repl_open_cmd = view.right(50),
			},
			keymaps = {
				toggle_repl = "<leader>rr",
				restart_repl = "<leader>rR",
				send_motion = "<leader>rv",
				visual_send = "<leader>rv",
				send_file = "<leader>rf",
				send_line = "<leader>rl",
				send_paragraph = "<leader>rp",
				send_until_cursor = "<leader>ru",
				send_code_block = "<leader>rb",
				send_code_block_and_move = "<leader>rn",
				cr = "<leader>r<cr>",
				interrupt = "<leader>r<space>",
				exit = "<leader>rq",
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true,
		})
	end,
}
