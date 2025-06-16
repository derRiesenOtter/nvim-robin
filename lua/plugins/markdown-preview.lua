return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.keymap.set("n", "<leader>cp", "<cmd>MarkdownPreviewToggle<CR>", {
					buffer = true,
					desc = "Toggle Markdown Preview",
				})
			end,
		})
	end,
}
