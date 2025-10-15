-- ============================================================================
-- KEYMAPS CONFIGURATION
-- ============================================================================
-- All custom keybindings organized by category.
-- Leader key is <Space> (configured in options.lua)
-- ============================================================================

local opts = { noremap = true, silent = true }

-- ============================================================================
-- GENERAL
-- ============================================================================
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- ============================================================================
-- DIAGNOSTICS
-- ============================================================================
vim.keymap.set("n", "<leader>xd", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- ============================================================================
-- TERMINAL
-- ============================================================================
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", { desc = "Toggle Terminal from terminal mode" })

-- ============================================================================
-- WINDOW NAVIGATION
-- ============================================================================
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

-- ============================================================================
-- BUFFER NAVIGATION
-- ============================================================================
vim.keymap.set("n", "<TAB>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- ============================================================================
-- SELECTION
-- ============================================================================
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- ============================================================================
-- SEARCH
-- ============================================================================
vim.keymap.set("n", "<c-f>", "<cmd>HopPattern<CR>", { noremap = false, desc = "Hop to pattern" })

-- ============================================================================
-- SEARCH AND REPLACE
-- ============================================================================
vim.keymap.set("n", "<leader>rl", ":s//g<LEFT><LEFT>", { desc = "Replace in line" })
vim.keymap.set("n", "<leader>rf", ":%s//g<LEFT><LEFT>", { desc = "Replace in file" })

-- ============================================================================
-- GIT
-- ============================================================================
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })

-- ============================================================================
-- CODE NAVIGATION
-- ============================================================================
vim.keymap.set("n", "<leader>ta", ":AerialToggle<CR>", { desc = "Toggle Aerial (code outline)" })

-- ============================================================================
-- VISUAL MODE ENHANCEMENTS
-- ============================================================================
-- Stay in indent mode after indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Move selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ============================================================================
-- TEXT EDITING
-- ============================================================================
vim.keymap.set("n", "dw", 'vb"_d', { desc = "Delete word backwards" })

-- ============================================================================
-- CODE FORMATTING
-- ============================================================================
vim.keymap.set("n", "<leader>cf", function()
  require("config.formatting").format_buffer()
end, { desc = "Format current buffer" })
