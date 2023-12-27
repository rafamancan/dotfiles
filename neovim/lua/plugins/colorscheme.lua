return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
