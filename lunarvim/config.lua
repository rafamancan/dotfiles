-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "dracula"
vim.opt.relativenumber = true
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.show_icons.git = 0
vim.opt.timeoutlen = 500

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode = {
  ["<TAB>"] = ":bnext<CR>",
  ["<S-TAB>"] = ":bprevious<CR>",
  ["<C-s>"] = ":w<CR>",
  ["<C-a>"] = "ggVG",
  ["<leader>rl"] = ":s//g<LEFT><LEFT>",
  ["<leader>rf"] = ":%s//g<LEFT><LEFT>",
  ["<C-p>"] = ":Telescope find_files<CR>",
  ["<C-f>"] = ":Telescope live_grep<CR>",
  ["<leader>d"] = ":lua vim.lsp.buf.definition()<CR>",
  ["<leader>t"] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
  ["<leader>a"] = ":lua require('harpoon.mark').add_file()<CR>"
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

-- Additional Plugins
lvim.plugins = {
  { "dracula/vim" },
  { "martinsione/darkplus.nvim" },
  { "ThePrimeagen/harpoon" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "wakatime/vim-wakatime" },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.php", "setlocal ts=4 sw=4" },
}
