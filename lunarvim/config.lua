-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "dracula"
vim.opt.relativenumber = true
lvim.builtin.alpha.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
vim.opt.timeoutlen = 500
vim.opt.clipboard = "unnamedplus"

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
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "wakatime/vim-wakatime" },
  { "github/copilot.vim" },
}

-- copilot setup
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"
lvim.builtin.cmp.mapping["<C-e>"] = function(fallback)
  cmp.mapping.abort()
  local copilot_keys = vim.fn["copilot#Accept"]()
  if copilot_keys ~= "" then
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  else
    fallback()
  end
end

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- New way to add custom autocmd (https://github.com/LunarVim/LunarVim/pull/2592)
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.php" },
  command = "setlocal ts=4 sw=4"
})
