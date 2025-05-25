return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add Harpoon",
      },
      {
        "<leader>hl",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon Menu",
      },
    },
  },
  {
    "wakatime/vim-wakatime",
    event = "BufReadPost", -- ao invés de lazy = false
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })
      end,
    },
  },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "stevearc/aerial.nvim",
    opts = {
      backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
      layout = {
        max_width = { 50, 0.3 },
        width = nil,
        min_width = 30,
        win_opts = {},
        default_direction = "prefer_right",
        placement = "window",
        resize_to_content = true,
        preserve_equality = false,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("nvim-tmux-navigation").setup({})
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        direction = "float",
        open_mapping = [[<c-t>]],
      })
    end,
  },
}
