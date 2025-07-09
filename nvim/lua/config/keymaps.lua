local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Window/Pane Navigation (Tmux integration takes precedence)
keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", opts)
keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", opts)
keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", opts)
keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", opts)

-- Buffer Navigation
keymap.set("n", "<TAB>", ":bnext<CR>", opts)
keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts)

-- File Operations
keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Selection
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Search
keymap.set("n", "<c-f>", "<cmd>HopPattern<CR>", { noremap = false })

-- Search and Replace
keymap.set("n", "<leader>rl", ":s//g<LEFT><LEFT>", { desc = "Replace in line" })
keymap.set("n", "<leader>rf", ":%s//g<LEFT><LEFT>", { desc = "Replace in file" })

-- Toggle Options
keymap.set("n", "<leader>wr", ":set wrap!<CR>", { desc = "Toggle wrap" })

-- LSP
keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Rename" })

-- Visual Mode Enhancements
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Paste without overwriting register
keymap.set("v", "p", '"_dP', opts)

-- Move selected text
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Text Editing
keymap.set("n", "dw", 'vb"_d', { desc = "Delete word backwards" })

-- Load which-key mappings
require("config/whichkey")