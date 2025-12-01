-- ============================================================================
-- EDITOR PLUGINS CONFIGURATION
-- ============================================================================
-- Navigation, file management, and editor enhancement plugins.
-- ============================================================================

return {
  -- ==========================================================================
  -- HOP - Jump to any location
  -- ==========================================================================
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {},
  },

  -- ==========================================================================
  -- HARPOON - Quick file navigation
  -- ==========================================================================
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon: Add file",
      },
      {
        "<leader>hl",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon: Menu",
      },
    },
  },

  -- ==========================================================================
  -- LUASNIP - Snippet engine
  -- ==========================================================================
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        -- Load VSCode-style snippets
        require("luasnip.loaders.from_vscode").lazy_load()
        -- Load custom snippets from config directory
        require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })
      end,
    },
  },

  -- ==========================================================================
  -- WAKATIME - Time tracking
  -- ==========================================================================
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy", -- Lazy load to improve startup
  },

  -- ==========================================================================
  -- AERIAL - Code outline navigator
  -- ==========================================================================
  {
    "stevearc/aerial.nvim",
    opts = {
      backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
      layout = {
        max_width = { 50, 0.3 }, -- Max width: 50 columns or 30% of window
        width = nil, -- Auto-calculate width
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

  -- ==========================================================================
  -- TMUX NAVIGATOR - Seamless navigation between tmux and vim
  -- ==========================================================================
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- ==========================================================================
  -- OIL - File explorer as a buffer
  -- ==========================================================================
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- ==========================================================================
  -- TOGGLETERM - Better terminal integration
  -- ==========================================================================
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm" },
    keys = { "<c-t>" },
    opts = {
      size = 15,
      direction = "float",
      open_mapping = [[<c-t>]],
      float_opts = {
        border = "curved",
        width = 120,
        height = 30,
      },
    },
  },

  -- ==========================================================================
  -- LAZYGIT - Git UI
  -- ==========================================================================
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },
}
