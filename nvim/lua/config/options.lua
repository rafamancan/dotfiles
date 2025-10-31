-- ============================================================================
-- NEOVIM OPTIONS CONFIGURATION
-- ============================================================================
-- This file contains all core Neovim settings and options.
-- Organized by category for easy maintenance.
-- ============================================================================

-- ============================================================================
-- LAZYVIM PREFERENCES
-- ============================================================================
-- Use Intelephense as primary PHP LSP (but phpactor is also enabled for refactoring)
vim.g.lazyvim_php_lsp = "intelephense"

-- ============================================================================
-- LEADERS
-- ============================================================================
vim.g.mapleader = " " -- Space as leader key for custom mappings
vim.g.maplocalleader = " " -- Space as local leader for filetype-specific mappings

-- ============================================================================
-- ENCODING
-- ============================================================================
vim.scriptencoding = "utf-8" -- Script encoding
vim.opt.encoding = "utf-8" -- Internal encoding
vim.opt.fileencoding = "utf-8" -- File encoding when writing

-- ============================================================================
-- EDITOR BEHAVIOR
-- ============================================================================
vim.opt.mouse = "a" -- Enable mouse support in all modes
vim.opt.autowrite = true -- Automatically write file when switching buffers
vim.opt.autoread = true -- Automatically read file when changed outside Vim
vim.opt.cursorline = true -- Highlight current line
vim.opt.breakindent = true -- Preserve indentation in wrapped text
vim.opt.wrap = false -- Disable line wrapping
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below

-- ============================================================================
-- SEARCH
-- ============================================================================
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show search matches as you type
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase

-- ============================================================================
-- INDENTATION
-- ============================================================================
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation level
vim.opt.softtabstop = 4 -- Number of spaces for <Tab> in insert mode
vim.opt.tabstop = 4 -- Number of spaces a <Tab> counts for
vim.opt.smartindent = true -- Smart autoindenting on new lines
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth

-- ============================================================================
-- LINE NUMBERS & SIGNS
-- ============================================================================
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.signcolumn = "yes" -- Always show sign column to prevent text shifting

-- ============================================================================
-- VISUAL GUIDES
-- ============================================================================
vim.opt.colorcolumn = { "80", "120" } -- Show vertical rulers at 80 and 120 columns
vim.opt.list = true -- Show invisible characters
vim.opt.listchars = {
  trail = "·", -- Show trailing spaces
  tab = " »", -- Show tabs
  nbsp = "␣", -- Show non-breaking spaces
}

-- ============================================================================
-- CLIPBOARD
-- ============================================================================
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for all operations

-- ============================================================================
-- UNDO & HISTORY
-- ============================================================================
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Undo file directory
vim.opt.history = 1000 -- Command history size

-- ============================================================================
-- BACKUP & SWAP FILES
-- ============================================================================
vim.opt.backup = false -- Disable backup files
vim.opt.writebackup = false -- Disable backup before overwriting file
vim.opt.swapfile = false -- Disable swap files

-- ============================================================================
-- COMPLETION
-- ============================================================================
vim.opt.completeopt = "menuone,noselect" -- Better completion experience
vim.opt.pumheight = 10 -- Maximum popup menu height

-- ============================================================================
-- TIMING & PERFORMANCE
-- ============================================================================
vim.opt.updatetime = 250 -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 300 -- Time to wait for mapped sequence (ms)
vim.opt.synmaxcol = 300 -- Max column for syntax highlighting (performance)
vim.opt.ttyfast = true -- Faster redrawing

-- ============================================================================
-- UI
-- ============================================================================
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.showcmd = true -- Show command in status line
vim.opt.laststatus = 3 -- Global statusline
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.cmdheight = 1 -- Command line height

-- ============================================================================
-- TRANSPARENCY
-- ============================================================================
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

-- ============================================================================
-- PLUGIN SETTINGS
-- ============================================================================
vim.g.autoformat = false -- Disable auto-formatting on save
vim.g.snacks_animate = false -- Disable Snacks animations for better performance

-- ============================================================================
-- FILETYPE ASSOCIATIONS
-- ============================================================================
vim.filetype.add({
  extension = { jsonc = "json" }, -- Treat .jsonc files as JSON
})


