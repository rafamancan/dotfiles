return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    keys = {
      { "<c-f>", false, mode = { "i", "n", "s" } },
      { "<c-b>", false, mode = { "i", "n", "s" } },
    },
    opts = {
      presets = {
        lsp_doc_border = true,
        inc_rename = true,
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- animations
  {
    "echasnovski/mini.animate",
    enable = false,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "buffers",
        separator_style = "sloped",
        show_buffer_close_icons = false,
        show_close_icon = true,
        persist_size = false,
        diagnostics = "nvim_lsp",
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        globalstatus = true,
        theme = "gruvbox",
      },
    },
  },

  -- filename
  -- {
  --   "b0o/incline.nvim",
  --   opts = {},
  --   event = "VeryLazy",
  -- },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree right reveal toggle<CR>", desc = "Toggle file tree" },
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 60,
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
        filesystem = {
          follow_current_file = {
            enbaled = true,
            leave_dirs_open = false,
          },
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules",
              "vendor",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
          },
        },
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        direction = "horizontal",
        open_mapping = [[<c-t>]],
      })
    end,
  },
}
