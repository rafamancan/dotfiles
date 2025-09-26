return {
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "<leader>sa",
        delete = "<leader>sd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "<leader>sr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint", "php_cs_fixer" },
      },
      formatters = {
        php_cs_fixer = {
          command = vim.fn.stdpath("data") .. "/mason/bin/php-cs-fixer",
          args = { 
            "fix", 
            "--rules=@PSR2,@PSR12,array_syntax,binary_operator_spaces,blank_line_after_opening_tag,cast_spaces,concat_space,function_declaration,method_argument_space,no_unused_imports,ordered_imports,return_type_declaration,single_blank_line_before_namespace,trailing_comma_in_multiline", 
            "--using-cache=no", 
            "$FILENAME" 
          },
          stdin = false,
        },
        pint = {
          command = vim.fn.stdpath("data") .. "/mason/bin/pint",
          args = { "--preset=psr12", "$FILENAME" },
          stdin = false,
        },
      },
    },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = false })
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
  },
}

