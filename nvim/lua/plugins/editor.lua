return {
  {
    "telescope.nvim",
    dependencies = {
      -- project management
      {
        "ahmedkhalf/project.nvim",
        opts = {
          manual_mode = true,
        },
        event = "VeryLazy",
        config = function(_, opts)
          require("project_nvim").setup(opts)
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("projects")
          end)
          require("telescope").setup({
            defaults = {
              file_ignore_patterns = {
                "node_modules",
                ".git",
                "public",
                "dist",
                "vendor",
                "composer.lock",
              },
            },
          })
        end,
        keys = {
          { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
          { "<C-e>", "<Cmd>Telescope buffers<CR>", desc = "Buffers" },
          { "<C-p>", "<Cmd>Telescope find_files<CR>", desc = "List files" },
        },
      },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
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
    "folke/snacks.nvim",
    lazy = false,
    opts = function()
      local logo = [[
            ██████╗  █████╗ ███████╗ █████╗ ███╗   ███╗ █████╗ ███╗   ██╗ ██████╗ █████╗ ███╗   ██╗
            ██╔══██╗██╔══██╗██╔════╝██╔══██╗████╗ ████║██╔══██╗████╗  ██║██╔════╝██╔══██╗████╗  ██║
            ██████╔╝███████║█████╗  ███████║██╔████╔██║███████║██╔██╗ ██║██║     ███████║██╔██╗ ██║
            ██╔══██╗██╔══██║██╔══╝  ██╔══██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║     ██╔══██║██║╚██╗██║
            ██║  ██║██║  ██║██║     ██║  ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║╚██████╗██║  ██║██║ ╚████║
            ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝

  🐷
            ]]

      logo = string.rep("\n", 1) .. logo .. "\n"

      local footer = [[

  🐷 Bora trabalhar um porco?

]]

      local keys = {
        { icon = " ", key = "s", desc = "Lazy Sync Update", action = ":Lazy sync" },
        { icon = " ", key = "t", desc = "Treesitter Update", action = ":TSUpdateSync" },
        {
          icon = "󱚝 ",
          desc = "Mason",
          action = ":Mason",
          key = "m",
        },
        { icon = "󰿅 ", key = "q", desc = "Quit", action = ":q" },
      }
      return {
        dashboard = {
          width = 100,
          enabled = true,
          pane_gap = 1,
          preset = {
            header = logo,
            keys = keys,
            footer = footer,
          },
          sections = {
            { section = "header" },
            { section = "keys", gap = 1 },
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 1, 1 } },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = { 1, 0 } },
            { section = "startup" },
          },
        },
        bigfile = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
      }
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
