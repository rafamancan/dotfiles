---@diagnostic disable: undefined-doc-name
return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
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
        "phpactor",
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
        "pint",
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
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    keys = {
      { "<leader>cf", false },
    },
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        phpactor = {
          filetypes = { "php" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("composer.json", ".git")(fname)
          end,
          single_file_support = false,
          capabilities = {
            documentFormattingProvider = false,
            documentRangeFormattingProvider = false,
          },
          init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
            ["language_server_worse_reflection.enabled"] = true,
            ["worse_reflection.cache_lifetime"] = 60,
            ["worse_reflection.stub_cache.enabled"] = true,
            ["indexer.enabled"] = true,
            ["indexer.include_patterns"] = { "**/*.php" },
            ["indexer.exclude_patterns"] = { "**/vendor/**", "**/node_modules/**", "**/storage/**", "**/public/**" },
            ["code_transform.import_globals"] = true,
            ["completion_worse.completor.constant.enabled"] = true,
            ["completion_worse.completor.constructor.enabled"] = true,
            ["completion_worse.completor.class_member.enabled"] = true,
            ["completion_worse.completor.local_variable.enabled"] = true,
            ["completion_worse.completor.use.enabled"] = true,
            ["completion_worse.completor.scoped_class.enabled"] = true,
          },
          settings = {
            phpactor = {
              completion = {
                insertUseDeclaration = true,
                triggerParameterHints = true,
              },
              diagnostics = {
                enable = true,
              },
              references = {
                enabled = true,
              },
              goto_definition = {
                strategy = "tolerant",
              },
              indexer = {
                enabled = true,
                poll_time = 100,
                watch_patterns = { "**/*.php" },
                exclude_patterns = { "**/vendor/**", "**/node_modules/**", "**/storage/**", "**/public/**" },
              },
              composer = {
                autoload_deduction = true,
                enable_cache = true,
              },
              file_path_resolver = {
                enable_cache = true,
                cache_lifetime = 5,
              },
            },
          },
          capabilities = {
            textDocument = {
              definition = {
                dynamicRegistration = false,
                linkSupport = true,
              },
            },
          },
          flags = {
            debounce_text_changes = 150,
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
