return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
		end,
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "python",
				callback = function()
					-- vim.keymap.set("n", "<leader>cm", ":MoltenEvaluateOperator<CR>", { buffer = true, silent = true, desc = "run operator selection" })
					vim.keymap.set(
						"n",
						"<leader>cl",
						":MoltenEvaluateLine<CR>",
						{ buffer = true, silent = true, desc = "evaluate line" }
					)
					vim.keymap.set(
						"n",
						"<leader>cr",
						":MoltenReevaluateCell<CR>",
						{ buffer = true, silent = true, desc = "re-evaluate cell" }
					)
					vim.keymap.set(
						"v",
						"<leader>cs",
						":<C-u>MoltenEvaluateVisual<CR>l",
						{ buffer = true, silent = true, desc = "evaluate visual selection" }
					)
					vim.keymap.set(
						"n",
						"<leader>cx",
						":MoltenDelete<CR>",
						{ buffer = true, silent = true, desc = "molten delete cell" }
					)
					vim.keymap.set(
						"n",
						"<leader>ch",
						":MoltenHideOutput<CR>",
						{ buffer = true, silent = true, desc = "hide output" }
					)
					vim.keymap.set(
						"n",
						"<leader>cw",
						":noautocmd MoltenEnterOutput<CR>",
						{ buffer = true, silent = true, desc = "show/enter output" }
					)
					vim.keymap.set("n", "<leader>ci", function()
						local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
						if venv ~= nil then
							venv = string.match(venv, "/.+/(.+)")
							vim.cmd(("MoltenInit %s"):format(venv))
						else
							vim.cmd("MoltenInit python3")
						end
					end, { buffer = true, desc = "Initialize Molten for python3", silent = true })
				end,
			})
		end,
	},
	{
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "kitty",
			integrations = {
				typst = {
					enabled = false,
					-- filetypes = { "typst" },
					-- floating_windows = true,
					-- only_render_image_at_cursor_mode = "popup",
					-- only_render_image_at_cursor = true,
				},
			},
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
