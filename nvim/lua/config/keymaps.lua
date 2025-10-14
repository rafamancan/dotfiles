local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>xd", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", { desc = "Toggle Terminal from terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Buffer Navigation
vim.keymap.set("n", "<TAB>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- File Operations
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Selection
vim.keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Search
vim.keymap.set("n", "<c-f>", "<cmd>HopPattern<CR>", { noremap = false })

-- Search and Replace
vim.keymap.set("n", "<leader>rl", ":s//g<LEFT><LEFT>", { desc = "Replace in line" })
vim.keymap.set("n", "<leader>rf", ":%s//g<LEFT><LEFT>", { desc = "Replace in file" })

-- Lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })

-- Aerial
vim.keymap.set("n", "<leader>ta", ":AerialToggle<CR>", { desc = "Toggle Aerial" })

-- Visual Mode Enhancements
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP', opts)

-- Move selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Text Editing
vim.keymap.set("n", "dw", 'vb"_d', { desc = "Delete word backwards" })

-- Code Formatting
vim.keymap.set("n", "<leader>cf", function()
  require("config.formatting").format_buffer()
end, { desc = "Format current buffer" })
