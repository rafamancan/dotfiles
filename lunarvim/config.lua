-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "catppuccin-mocha"
vim.opt.relativenumber = true
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
vim.opt.timeoutlen = 500
vim.opt.clipboard = "unnamedplus"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode = {
  ["<TAB>"] = ":bnext<CR>",
  ["<S-TAB>"] = ":bprevious<CR>",
  ["<C-s>"] = ":w<CR>",
  ["<C-a>"] = "ggVG",
  ["<leader>rl"] = ":s//g<LEFT><LEFT>",
  ["<leader>rf"] = ":%s//g<LEFT><LEFT>",
  ["<C-p>"] = ":Telescope find_files<CR>",
  ["<C-f>"] = ":Telescope live_grep<CR>",
  ["<A-a>"] = ":lua require(\"harpoon.mark\").add_file()<CR>",
  ["<A-h>"] = ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>",
  ["<C-t>"] = ":ToggleTerm<CR>",
  ["<C-y>"] = ":Copilot panel<CR>",
}

-- Reminder: C-n multiple-cursors

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
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
  "php",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "ThePrimeagen/harpoon" },
  { "wakatime/vim-wakatime" },
  { "terryma/vim-multiple-cursors" },
  { "catppuccin/nvim",             name = "catppuccin" },
  { "jwalton512/vim-blade" },
  -- GITHUB COPILOT
  -- { "github/copilot.vim" },
  -- ZBIRENBAUM COPILOT
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}

-- copilot setup: GITHUB
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
-- local cmp = require "cmp"
-- lvim.builtin.cmp.mapping["<C-l>"] = function(fallback)
--   cmp.mapping.abort()
--   local copilot_keys = vim.fn["copilot#Accept"]()
--   if copilot_keys ~= "" then
--     vim.api.nvim_feedkeys(copilot_keys, "i", true)
--   else
--     fallback()
--   end
-- end

-- copilot setup: ZBIRENBAUM
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- New way to add custom autocmd (https://github.com/LunarVim/LunarVim/pull/2592)
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.php" },
  command = "setlocal ts=4 sw=4"
})

-- require("lvim.lsp.manager").setup("emmet_ls")
-- require("lvim.lsp.manager").setup("phpactor")
-- require("lvim.lsp.manager").setup("phpcbf")
-- require("lvim.lsp.manager").setup("phpstan")

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua",  filetype = { "lua" } },
  { command = "prettier" },
})
