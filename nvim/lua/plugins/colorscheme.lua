return {
  -- Ayu colorscheme
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      local colors = require("ayu.colors")
      colors.generate(false) -- false = dark variant

      require("ayu").setup({
        mirage = false, -- Set to true for mirage variant
        terminal = true, -- Set terminal colors
        overrides = {
          -- Brighten dark text for better visibility
          Comment = { fg = "#6C7380" },
          NonText = { fg = "#6C7380" },
          SnacksDashboardDir = { fg = "#6C7380" },
          SnacksDashboardFile = { fg = colors.fg },
        },
      })
    end,
  },

  -- Configure LazyVim to use ayu-dark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-dark",
    },
  },
}
