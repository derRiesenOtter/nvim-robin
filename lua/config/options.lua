-- set leader keys
vim.g.mapleader = " "

-- set 2 spaces as tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- set clipboard to system clipboard
vim.opt.clipboard = "unnamedplus"

-- set some visuals
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.cmdheight = 0
-- vim.opt.textwidth = 80
vim.opt.scrolloff = 5

-- set persistent undos
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME") .. "/.vim_undo"

-- set venv for python especially molten
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "●",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.INFO] = "■",
			[vim.diagnostic.severity.HINT] = "○",
		},
	},
})
