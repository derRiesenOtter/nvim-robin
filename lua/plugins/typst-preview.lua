return {
	"chomosuke/typst-preview.nvim",
	ft = "typst",
	version = "1.*",
	opts = {
		dependencies_bin = { ["tinymist"] = "tinymist" },
	},
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "typst",
			callback = function()
				vim.keymap.set("n", "<leader>cp", "<cmd>TypstPreviewToggle<CR>", {
					buffer = true,
					desc = "Toggle Typst Preview",
				})
			end,
		})
	end,
}
