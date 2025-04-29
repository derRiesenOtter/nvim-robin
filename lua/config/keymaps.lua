-- unhiglight the search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true, noremap = true })

-- faster navigation between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- lsp
vim.keymap.set("n", "gla", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Actions" })

vim.keymap.set("n", "glc", function()
	vim.lsp.buf.rename()
end, { desc = "Smart Rename" })

vim.keymap.set("n", "gll", function()
	vim.diagnostic.open_float()
end, { desc = "Show Line Diagnostics" })

vim.keymap.set("n", "glj", function()
	vim.diagnostic.goto_next()
end, { desc = "Goto Next Diagnostic" })

vim.keymap.set("n", "glk", function()
	vim.diagnostic.goto_prev()
end, { desc = "Goto Previous Diagnostic" })
