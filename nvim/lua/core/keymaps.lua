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
keymap.set("n", "<C-a>", "ggVG", opts)
keymap.set("n", "<leader>rl", ":s//g<LEFT><LEFT>")
keymap.set("n", "<leader>rf", ":%s//g<LEFT><LEFT>")

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Paste without overwriting register
keymap.set("v", "p", '"_dP')
