-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Editor behavior
vim.opt.mouse = "a"
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.cursorline = true
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftround = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Visual guides
vim.opt.colorcolumn = { "80", "120" }
vim.opt.list = true
vim.opt.listchars = {
  trail = "·",
  tab = " »",
  nbsp = "␣",
}

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Undo
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Backup and swap
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Completion
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight = 10

-- Timing
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- UI
vim.opt.termguicolors = true
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.cmdheight = 1

-- Transparency
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

-- Performance
vim.opt.synmaxcol = 300
vim.opt.history = 1000
vim.opt.ttyfast = true

-- Plugin settings
vim.g.autoformat = false
vim.g.snacks_animate = false

vim.filetype.add({
  extension = { jsonc = 'json' }
})


