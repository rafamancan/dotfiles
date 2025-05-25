vim.g.maplocalleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.o.hlsearch = false
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = { "80", "120" }
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.timeoutlen = 500
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.opt.showtabline = 2
vim.g.autoformat = false

vim.opt.ttyfast = true
vim.opt.synmaxcol = 300
vim.opt.history = 100
vim.opt.writebackup = false

-- show hidden characters
vim.opt.list = true
vim.opt.listchars = {
  trail = "·",
  tab = " »",
}

-- use spaces for tabs and whatnot
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd([[ set noswapfile ]])
vim.cmd([[ set termguicolors ]])

vim.g.snacks_animate = false
