return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
		end,
		config = function()
			vim.keymap.set(
				"n",
				"<localleader>e",
				":MoltenEvaluateOperator<CR>",
				{ silent = true, desc = "run operator selection" }
			)
			vim.keymap.set("n", "<localleader>l", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
			vim.keymap.set(
				"n",
				"<localleader>rr",
				":MoltenReevaluateCell<CR>",
				{ silent = true, desc = "re-evaluate cell" }
			)
			vim.keymap.set(
				"v",
				"<localleader>r",
				":<C-u>MoltenEvaluateVisual<CR>r",
				{ silent = true, desc = "evaluate visual selection" }
			)
			vim.keymap.set("n", "<localleader>x", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
			vim.keymap.set("n", "<localleader>h", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
			vim.keymap.set(
				"n",
				"<localleader>t",
				":noautocmd MoltenEnterOutput<CR>",
				{ silent = true, desc = "show/enter output" }
			)
			vim.keymap.set("n", "<localleader>i", function()
				local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
				if venv ~= nil then
					-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
					venv = string.match(venv, "/.+/(.+)")
					vim.cmd(("MoltenInit %s"):format(venv))
				else
					vim.cmd("MoltenInit python3")
				end
			end, { desc = "Initialize Molten for python3", silent = true })
		end,
	},
	{
		-- see the image.nvim readme for more information about configuring this plugin
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "kitty", -- whatever backend you would like to use
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
