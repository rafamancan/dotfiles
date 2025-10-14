return {
  -- PHP Language Server - Intelephense only
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              stubs = {
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
                -- Laravel
                "laravel",
              },
              files = {
                maxSize = 5000000,
              },
              format = {
                enable = false, -- Usar conform.nvim para formatação
              },
              environment = {
                phpVersion = "8.2.0",
              },
            },
          },
        },
      },
    },
  },

  -- Desabilitar conform.nvim para PHP (usando none-ls)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      -- Remover PHP do conform (usando none-ls para formatação)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = nil
    end,
  },

  -- Desabilitar nvim-lint para PHP (usando none-ls)
  -- LazyVim extras.lang.php ativa phpcs no nvim-lint, precisamos desabilitar
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      -- Remover PHP do nvim-lint (usando none-ls para linting)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = {}  -- Array vazio ao invés de nil
    end,
  },

  -- Better PHP syntax
  {
    "StanAngeloff/php.vim",
    ft = "php",
  },

  -- Laravel specific tools
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>lm", ":Laravel related<cr>", desc = "Laravel Related" },
    },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup({
        lsp_server = "intelephense",
        features = {
          null_ls = {
            enable = false, -- Usando conform e nvim-lint
          },
        },
      })
    end,
  },

  -- Testing com Pest
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
          parallel = 16, -- Para suportar --parallel
        })
      )
    end,
  },

  -- DAP para debugging com XDebug
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
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
          },
        },
      }
    end,
  },
}
