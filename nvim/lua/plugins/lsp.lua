---@diagnostic disable: undefined-doc-name
return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- suggestions
      -- "actionlint",
      -- "bash-debug-adapter",
      -- "bash-language-server",
      -- "blade-formatter",
      -- "css-lsp",
      -- "docker-compose-language-service",
      -- "dockerfile-language-server",
      -- "dot-language-server",
      -- "eslint_d",
      -- "hadolint",
      -- "html-lsp",
      -- "impl",
      -- "intelephense",
      -- "js-debug-adapter",
      -- "json-lsp",
      -- "lua-language-server",
      -- "luacheck",
      -- "markdownlint",
      -- "marksman",
      -- "nginx-language-server",
      -- "php-debug-adapter",
      -- "phpstan",
      -- "php-cs-fixer",
      -- "prettier",
      -- "pyright",
      -- "shellcheck",
      -- "shfmt",
      -- "sqlfluff",
      -- "stylelint",
      -- "stylua",
      -- "tailwindcss-language-server",
      -- "typescript-language-server",
      -- "yaml-language-server",
      vim.list_extend(opts.ensure_installed, {
        "actionlint",
        "bash-debug-adapter",
        "bash-language-server",
        "blade-formatter",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "dot-language-server",
        "eslint_d",
        "hadolint",
        "html-lsp",
        "impl",
        "intelephense",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "luacheck",
        "markdownlint",
        "marksman",
        "nginx-language-server",
        "php-debug-adapter",
        "phpstan",
        "php-cs-fixer",
        "prettier",
        "pyright",
        "shellcheck",
        "shfmt",
        "sqlfluff",
        "stylelint",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {},
    },
  },
}
