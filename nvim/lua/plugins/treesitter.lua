-- ============================================================================
-- TREESITTER CONFIGURATION
-- ============================================================================
-- Advanced syntax highlighting and code understanding using Tree-sitter.
-- ============================================================================

return {
  -- ==========================================================================
  -- NVIM-TREESITTER - Modern syntax highlighting
  -- ==========================================================================
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- Lazy load on file open
    opts = {
      ensure_installed = {
        -- Scripting
        "lua",
        "bash",

        -- Web Development
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",

        -- PHP/Laravel
        "php",
        "php_only",
        "phpdoc",
        "blade",

        -- Data formats
        "json",
        "yaml",

        -- Documentation
        "markdown",
        "markdown_inline",

        -- Other
        "regex",
        "sql",
        "dockerfile",
        "gitignore",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
    dependencies = {
      -- Context-aware commenting
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {},
      },
      -- Enhanced text objects
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  -- ==========================================================================
  -- TREESITTER CONTEXT - Disabled for performance
  -- ==========================================================================
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false, -- Disable to reduce overhead
  },
}

