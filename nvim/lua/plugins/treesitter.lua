return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- Explicitly use the main branch
    build = ":TSUpdate",
    lazy = false, -- TreeSitter should not be lazy-loaded
    config = function()
      -- Setup treesitter with new API
      require("nvim-treesitter").setup({
        -- Directory to install parsers and queries (optional, uses default if not specified)
        -- install_dir = vim.fn.stdpath('data') .. '/site'
      })

      -- Install parsers
      local parsers_to_install = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",
        "php",
        "php_only",
        "phpdoc",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "regex",
        "sql",
        "dockerfile",
        "gitignore",
      }

      -- Install parsers asynchronously
      require("nvim-treesitter").install(parsers_to_install)

      -- Enable treesitter highlighting for supported filetypes
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
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {},
      },
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
}

