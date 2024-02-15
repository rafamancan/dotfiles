local discipline = require("rmancan.discipline")
discipline.cowboy()

local keymap = vim.keymap

local opts = { noremap = true, silent = true }
-- Navigate vim panes better
keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)

-- Personal :)
keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts)
keymap.set("n", "<leader>c", ":bd<CR>", opts)
keymap.set("n", "<TAB>", ":bnext<CR>", opts)
keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts)
keymap.set("n", "<C-s>", ":w<CR>", opts)
keymap.set("n", "<C-a>", "gg<S-v>G", opts)
keymap.set("n", "<leader>rl", ":s//g<LEFT><LEFT>")
keymap.set("n", "<leader>rf", ":%s//g<LEFT><LEFT>")

-- Inc Rename
keymap.set("n", "<leader>rn", ":IncRename ")

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Paste without overwriting register
keymap.set("v", "p", '"_dP')

-- Move block
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Neotree toggle
keymap.set("x", "<leader>e", "<cmd>Neotree right reveal toggle<CR>", { noremap = false, silent = true })

keymap.set("n", "<c-f>", "<cmd>HopPattern<CR>", { noremap = false })

require("config/whichkey")
