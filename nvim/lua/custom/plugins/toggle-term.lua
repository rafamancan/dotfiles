return {
  'akinsho/toggleterm.nvim',
  version = '*',
  lazy = false,
  config = function()
    require('toggleterm').setup {
      size = 15,
      direction = 'float',
      open_mapping = [[<c-t>]],
      float_opts = {
        border = 'curved',
        width = 120,
        height = 30,
      },
    }
  end,
}
