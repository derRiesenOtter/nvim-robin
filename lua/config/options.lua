-- set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

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
vim.opt.textwidth = 80

-- set persistent undos
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME") .. "/.vim_undo"

-- deactivate some commands
vim.api.nvim_set_keymap('n', 'gt', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gT', '<Nop>', { noremap = true, silent = true })
