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
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
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
        separator_style = "thick",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        theme = "tokyonight",
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

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
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      local logo = [[
            ██████╗  █████╗ ███████╗ █████╗ ███╗   ███╗ █████╗ ███╗   ██╗ ██████╗ █████╗ ███╗   ██╗
            ██╔══██╗██╔══██╗██╔════╝██╔══██╗████╗ ████║██╔══██╗████╗  ██║██╔════╝██╔══██╗████╗  ██║
            ██████╔╝███████║█████╗  ███████║██╔████╔██║███████║██╔██╗ ██║██║     ███████║██╔██╗ ██║
            ██╔══██╗██╔══██║██╔══╝  ██╔══██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║     ██╔══██║██║╚██╗██║
            ██║  ██║██║  ██║██║     ██║  ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║╚██████╗██║  ██║██║ ╚████║
            ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝
            ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local footer = [[

  🐷 Bora trabalhar um porco?

]]
      require("dashboard").setup({
        config = {
          header = vim.split(logo, "\n"),
          mru = { limit = 5, cwd_only = false },
          project = { enable = true, limit = 5 },
          shortcut = {
            { desc = " Sync Update", group = "@property", action = "Lazy sync", key = "s" },
            { desc = " Treesitter Update", group = "@property", action = "TSUpdateSync", key = "t" },
            {
              icon = "󱚝 ",
              icon_hl = "@variable",
              desc = "Mason",
              group = "Label",
              action = "Mason",
              key = "m",
            },
            { desc = "󰿅 Quit", group = "@property", action = "q", key = "q" },
          },
          footer = vim.split(footer, "\n"),
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
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
        direction = "float",
        open_mapping = [[<c-t>]],
      })
    end,
  },
}
