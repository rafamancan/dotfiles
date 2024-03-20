return {
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  -- copilot cmp source
  {
    'nvim-cmp',
    dependencies = {
      {
        'zbirenbaum/copilot-cmp',
        dependencies = 'copilot.lua',
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require 'copilot_cmp'
          copilot_cmp.setup(opts)
        end,
      },
    },
  },
  {
    'jwalton512/vim-blade',
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'V13Axel/neotest-pest',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-pest',
        },
      }
    end,
  },
}
