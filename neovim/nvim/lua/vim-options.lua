vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.swapfile = false
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.timeoutlen = 500
vim.opt.clipboard = "unnamedplus"

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Personal :)
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', "<leader>c", ":bd<CR>")
vim.keymap.set('n', "<TAB>", ":bnext<CR>")
vim.keymap.set('n', "<S-TAB>", ":bprevious<CR>")
vim.keymap.set('n', "<C-s>", ":w<CR>")
vim.keymap.set('n', "<C-a>", "ggVG")
vim.keymap.set('n', "<leader>rl", ":s//g<LEFT><LEFT>")
vim.keymap.set('n', "<leader>rf", ":%s//g<LEFT><LEFT>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.php" },
    command = "setlocal ts=4 sw=4"
})

vim.api.nvim_set_keymap("n", "<C-o>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>",
    { noremap = true, silent = true })

vim.g.multi_cursor_start_word_key = "<A-j>"

copilot_node_command = vim.fn.expand("$HOME") .. "/.config/nvm/versions/node/v20.10.0/bin/node"


vim.keymap.set('n', '<leader>e', ':Neotree reveal toggle<CR>', {})
