local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      -- -- LazyVim will use these options when formatting with the conform.nvim formatter
      -- format = {
      --   timeout_ms = 3000,
      --   async = false, -- not recommended to change
      --   quiet = false, -- not recommended to change
      -- },
      -- format_on_save = {
      --   -- These options will be passed to conform.format()
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
      -- ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        php = { "php-cs-fixer" },
        blade = { "blade-formatter", "rustywind" },
        python = { "black" },
        javascript = { { "prettierd", "prettier" } },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        php_cs_fixer = {
          meta = {
            url = "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer",
            description = "The PHP Coding Standards Fixer.",
          },
          command = util.find_executable({
            "tools/php-cs-fixer/vendor/bin/php-cs-fixer",
            "vendor/bin/php-cs-fixer",
          }, "php-cs-fixer"),
          args = { "fix", "$FILENAME" },
          stdin = false,
        },
      },
    }
    return opts
  end,
}
