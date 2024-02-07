return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    lazy = true,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
