vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- REMAPS
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)
keymap.set('n', '<C-s>', ':w<CR>', opts)

keymap.set('n', '<TAB>', ':bnext<CR>', opts)
keymap.set('n', '<S-TAB>', ':bprevious<CR>', opts)
keymap.set('n', '<C-a>', 'gg<S-v>G', opts)
keymap.set('n', '<leader>rl', ':s//g<LEFT><LEFT>')
keymap.set('n', '<leader>rf', ':%s//g<LEFT><LEFT>')

-- Stay in indent mode
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)

-- Paste without overwriting register
keymap.set('v', 'p', '"_dP')

-- Move block
keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Plugins remap
keymap.set('n', '<leader>ta', '<Cmd>AerialToggle<CR>', opts)
keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', opts)
keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', {})
keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', {})
keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', {})
keymap.set('n', '<c-f>', '<cmd>HopPattern<CR>', opts)
keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
keymap.set('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = '[A]dd file Harpoon' })
keymap.set('n', '<leader>hl', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = '[L]ist Harpoon' })
keymap.set('n', '<leader>bd', '<Cmd>BufferClose<CR>', opts)
keymap.set('n', '<leader>br', '<Cmd>BufferRestore<CR>', opts)
