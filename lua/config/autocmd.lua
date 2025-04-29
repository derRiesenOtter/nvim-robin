vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typst", "markdown", "latex" },
	command = "setlocal spell spelllang=en,de",
})
