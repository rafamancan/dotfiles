-- Configuração do none-ls (null-ls) para PHP
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    local h = require("null-ls.helpers")
    opts.sources = opts.sources or {}

    -- Remover PHPCS e phpcsfixer dos sources
    local filtered = {}
    for _, source in ipairs(opts.sources) do
      local name = type(source) == "table" and source.name or tostring(source)
      if not name:match("phpcs") and not name:match("phpcsfixer") then
        table.insert(filtered, source)
      end
    end
    opts.sources = filtered

    -- PHP CS Fixer - formatter customizado que executa diretamente no arquivo
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

    -- PHPStan - builtin padrão
    table.insert(opts.sources, null_ls.builtins.diagnostics.phpstan)

    return opts
  end,
}
