-- ============================================================================
-- PHP DEVELOPMENT CONFIGURATION
-- ============================================================================
-- Complete PHP development setup including LSP, Laravel tools, testing, and debugging.
-- ============================================================================

return {
  -- ==========================================================================
  -- INTELEPHENSE - PHP Language Server
  -- ==========================================================================
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              -- PHP extension stubs for better autocomplete
              stubs = {
                -- Core PHP
                "apache",
                "bcmath",
                "Core",
                "curl",
                "date",
                "dom",
                "fileinfo",
                "filter",
                "gd",
                "hash",
                "iconv",
                "json",
                "libxml",
                "mbstring",
                "mysqli",
                "openssl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "SimpleXML",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "standard",
                "superglobals",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlwriter",
                "zip",
                "zlib",
                -- Frameworks
                "laravel",
              },
              files = {
                maxSize = 5000000, -- 5MB max file size for indexing
              },
              format = {
                enable = false, -- Disable LSP formatting (using custom formatter)
              },
              environment = {
                phpVersion = "8.2.0", -- Target PHP version
              },
            },
          },
        },
      },
    },
  },

  -- ==========================================================================
  -- DISABLE DEFAULT FORMATTERS
  -- ==========================================================================
  -- We use custom PHP formatting (config.formatting module)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = nil -- Disable conform for PHP
    end,
  },

  -- ==========================================================================
  -- DISABLE DEFAULT LINTERS
  -- ==========================================================================
  -- LazyVim extras.lang.php enables phpcs by default, we disable it
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = {} -- Empty array disables linters for PHP
    end,
  },

  -- ==========================================================================
  -- IMPROVED PHP SYNTAX HIGHLIGHTING
  -- ==========================================================================
  {
    "StanAngeloff/php.vim",
    ft = "php", -- Only load for PHP files
  },

  -- ==========================================================================
  -- LARAVEL.NVIM - Laravel development tools
  -- ==========================================================================
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel: Artisan commands" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel: Routes" },
      { "<leader>lm", ":Laravel related<cr>", desc = "Laravel: Related files" },
    },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup({
        lsp_server = "intelephense",
        features = {
          null_ls = {
            enable = false, -- Using custom formatting setup
          },
        },
      })
    end,
  },

  -- ==========================================================================
  -- NEOTEST-PEST - Testing with Pest
  -- ==========================================================================
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "V13Axel/neotest-pest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-pest")({
          pest_cmd = function()
            return vim.fn.getcwd() .. "/vendor/bin/pest"
          end,
          parallel = 16, -- Enable parallel test execution
        })
      )
    end,
  },

  -- ==========================================================================
  -- XDEBUG - PHP Debugging with DAP
  -- ==========================================================================
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason.nvim",
        opts = { ensure_installed = { "php-debug-adapter" } },
      },
    },
    opts = function()
      local dap = require("dap")

      -- Configure PHP debug adapter
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
      }

      -- Configure debug configurations
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003, -- Xdebug 3 default port
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}", -- Docker path mapping
          },
        },
      }
    end,
  },
}
