return {
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'stevearc/aerial.nvim',
    opts = {
      backends = { 'treesitter', 'lsp', 'markdown', 'asciidoc', 'man' },
      layout = {
        max_width = { 50, 0.3 },
        width = nil,
        min_width = 30,
        win_opts = {},
        default_direction = 'prefer_right',
        placement = 'window',
        resize_to_content = true,
        preserve_equality = false,
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup {}
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 15,
        direction = 'float',
        open_mapping = [[<c-t>]],
      }
    end,
  },
  { 'ThePrimeagen/harpoon' },
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {},
    config = function()
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = false,
    },
    version = '^1.0.0',
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      term_colors = true,
      flavour = 'mocha',
      transparent_background = true,
    },
  },
}
