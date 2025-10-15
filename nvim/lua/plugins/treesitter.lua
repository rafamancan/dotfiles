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
    branch = "main",
    build = ":TSUpdate",
    lazy = false, -- Load immediately for better UX
    config = function()
      -- Setup treesitter with new API
      require("nvim-treesitter").setup({})

      -- Parsers to install for supported languages
      local parsers_to_install = {
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
      }

      -- Install parsers asynchronously
      require("nvim-treesitter").install(parsers_to_install)

      -- Auto-enable treesitter highlighting for supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "lua",
          "javascript",
          "typescript",
          "typescriptreact",
          "html",
          "css",
          "php",
          "json",
          "yaml",
          "markdown",
          "bash",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
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

