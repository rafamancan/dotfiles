-- ============================================================================
-- AUTOCMDS CONFIGURATION
-- ============================================================================
-- Custom autocommands for better editing experience.
-- Default LazyVim autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- ============================================================================

-- ============================================================================
-- HIGHLIGHT ON YANK
-- ============================================================================
-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
  desc = "Highlight yanked text",
})

-- ============================================================================
-- AUTO-RESIZE WINDOWS
-- ============================================================================
-- Automatically resize windows when terminal is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("resize_splits", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
  desc = "Resize splits when window is resized",
})

-- ============================================================================
-- CLOSE CERTAIN WINDOWS WITH 'q'
-- ============================================================================
-- Close help, man pages, and quickfix with 'q'
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = { "help", "man", "qf", "lspinfo", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  desc = "Close certain windows with 'q'",
})

-- ============================================================================
-- RESTORE CURSOR POSITION
-- ============================================================================
-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("restore_cursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Restore cursor position",
})

-- ============================================================================
-- DIM ON FOCUS LOST (for tmux pane switching)
-- ============================================================================
-- Darken Neovim when it loses focus to match tmux inactive pane style
vim.api.nvim_create_autocmd("FocusLost", {
  group = vim.api.nvim_create_augroup("dim_on_focus", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#050608" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#050608" })
  end,
  desc = "Dim background when focus is lost",
})

vim.api.nvim_create_autocmd("FocusGained", {
  group = vim.api.nvim_create_augroup("restore_on_focus", { clear = true }),
  callback = function()
    vim.cmd("colorscheme ayu-dark")
  end,
  desc = "Restore colorscheme when focus is gained",
})

-- ============================================================================
-- BLADE FILETYPE DETECTION
-- ============================================================================
-- Detect .blade.php files as blade filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("blade_filetype", { clear = true }),
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "blade"
  end,
  desc = "Set filetype for Blade templates",
})

-- ============================================================================
-- PHP SPECIFIC SETTINGS
-- ============================================================================
-- Set indentation to 4 spaces for PHP files
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("php_settings", { clear = true }),
  pattern = "php",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
  desc = "PHP-specific settings",
})

-- Set indentation to 4 spaces for Blade files
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("blade_settings", { clear = true }),
  pattern = "blade",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
  desc = "Blade-specific settings",
})
