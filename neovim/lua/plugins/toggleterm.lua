return {
  "akinsho/toggleterm.nvim",
  config = function()
    local config = require("toggleterm")
    config.setup({
      direction = "float",
      open_mapping = [[<c-t>]],
    })
  end,
}
