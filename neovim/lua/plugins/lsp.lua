return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "luacheck",
        "shfmt",
        "typescript-language-server",
        "css-lsp",
        "actionlint",
        "bash-language-server",
        "blade-formatter",
        "dot-language-server",
        "eslint_d",
        "html-lsp",
        "intelephense",
        "php-debug-adapter",
        "phpstan",
        "php-cs-fixer",
        "prettierd",
        "rustywind",
        "shellcheck",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
      })
    end,
  },
}
