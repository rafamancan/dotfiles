-- ============================================================================
-- NONE-LS CONFIGURATION (formerly null-ls)
-- ============================================================================
-- LSP-like diagnostics and formatting for languages without native LSP support.
-- ============================================================================

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    local null_ls = require("null-ls")
    local h = require("null-ls.helpers")
    opts.sources = opts.sources or {}

    -- ========================================================================
    -- REMOVE DEFAULT PHP FORMATTERS
    -- ========================================================================
    -- Remove PHPCS and phpcsfixer from sources (we use custom formatting)
    local filtered = {}
    for _, source in ipairs(opts.sources) do
      local name = type(source) == "table" and source.name or tostring(source)
      if not name:match("phpcs") and not name:match("phpcsfixer") then
        table.insert(filtered, source)
      end
    end
    opts.sources = filtered

    -- ========================================================================
    -- PHP CS FIXER - Custom formatter
    -- ========================================================================
    -- Note: This is disabled by default. Use <leader>cf for manual formatting.
    -- Auto-formatting is disabled in options.lua (vim.g.autoformat = false)
    table.insert(
      opts.sources,
      h.make_builtin({
        name = "phpcsfixer",
        method = null_ls.methods.FORMATTING,
        filetypes = { "php" },
        generator_opts = {
          command = "vendor/bin/php-cs-fixer",
          args = { "fix", "--quiet", "$FILENAME" },
          to_stdin = false,
          to_temp_file = false,
        },
        factory = h.formatter_factory,
      })
    )

    -- ========================================================================
    -- PHPSTAN - Static analysis
    -- ========================================================================
    -- Re-enabled with proper project root detection and configuration
    table.insert(
      opts.sources,
      null_ls.builtins.diagnostics.phpstan.with({
        cwd = function(params)
          -- Find project root (directory containing .git)
          return vim.fn.finddir(".git/..", vim.fn.fnamemodify(params.bufname, ":h") .. ";")
        end,
        extra_args = function(params)
          -- Only add --configuration if phpstan.neon exists in project root
          local root = vim.fn.finddir(".git/..", vim.fn.fnamemodify(params.bufname, ":h") .. ";")
          local config_file = root ~= "" and (root .. "/phpstan.neon") or nil
          if config_file and vim.fn.filereadable(config_file) == 1 then
            return { "--configuration", "phpstan.neon" }
          end
          return {}
        end,
      })
    )

    return opts
  end,
}
