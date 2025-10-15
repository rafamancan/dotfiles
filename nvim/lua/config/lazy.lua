-- ============================================================================
-- LAZY.NVIM CONFIGURATION
-- ============================================================================
-- Plugin manager setup and configuration.
-- This file bootstraps lazy.nvim and imports all plugin specs.
-- ============================================================================

-- ============================================================================
-- BOOTSTRAP LAZY.NVIM
-- ============================================================================
-- Auto-install lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- LAZY.NVIM SETUP
-- ============================================================================
require("lazy").setup({
  spec = {
    -- ========================================================================
    -- LAZYVIM BASE
    -- ========================================================================
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- ========================================================================
    -- LANGUAGE SUPPORT
    -- ========================================================================
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.php" },
    { import = "lazyvim.plugins.extras.lang.docker" },

    -- ========================================================================
    -- AI & CODING ASSISTANCE
    -- ========================================================================
    { import = "lazyvim.plugins.extras.ai.copilot" },

    -- ========================================================================
    -- UTILITIES
    -- ========================================================================
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "lazyvim.plugins.extras.util.dot" },

    -- ========================================================================
    -- LSP & FORMATTING
    -- ========================================================================
    { import = "lazyvim.plugins.extras.lsp.none-ls" },

    -- ========================================================================
    -- CODE EDITING
    -- ========================================================================
    { import = "lazyvim.plugins.extras.coding.mini-surround" },

    -- ========================================================================
    -- TESTING & DEBUGGING
    -- ========================================================================
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.dap.core" },

    -- ========================================================================
    -- CUSTOM PLUGINS
    -- ========================================================================
    { import = "plugins" },
  },

  defaults = {
    lazy = false, -- Don't lazy-load custom plugins by default
    version = false, -- Use latest git commit (not stable releases)
  },

  install = {
    colorscheme = { "tokyonight", "habamax" }, -- Fallback colorschemes during install
  },

  checker = {
    enabled = true, -- Automatically check for plugin updates
    notify = false, -- Don't notify about updates (reduces noise)
  },

  -- ========================================================================
  -- PERFORMANCE OPTIMIZATIONS
  -- ========================================================================
  performance = {
    rtp = {
      -- Disable unused built-in plugins for faster startup
      disabled_plugins = {
        "gzip", -- Gzip file support
        "tarPlugin", -- Tar file support
        "tohtml", -- Convert to HTML
        "tutor", -- Vim tutor
        "zipPlugin", -- Zip file support
      },
    },
  },
})
