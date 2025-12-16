return {
  "lukas-reineke/virt-column.nvim",
  opts = {
    char = "│",
    virtcolumn = "80,120",
    highlight = "VirtColumn",
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#ff0000" })
    require("virt-column").setup(opts)
  end,
}
