-- Disable problematic jsonc parser completely
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Remove jsonc from any ensure_installed lists
      if opts.ensure_installed then
        opts.ensure_installed = vim.tbl_filter(function(lang)
          return lang ~= "jsonc"
        end, opts.ensure_installed)
      end

      -- Add jsonc to ignore list
      opts.ignore_install = opts.ignore_install or {}
      if not vim.tbl_contains(opts.ignore_install, "jsonc") then
        table.insert(opts.ignore_install, "jsonc")
      end

      return opts
    end,
  },
}