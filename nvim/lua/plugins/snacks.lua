-- ============================================================================
-- SNACKS.NVIM CONFIGURATION
-- ============================================================================
-- Dashboard, picker, and UI enhancements.
-- ============================================================================

-- Custom dashboard logo
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

-- Dashboard action keys
local keys = {
  { icon = " ", key = "s", desc = "Lazy Sync Update", action = ":Lazy sync" },
  { icon = " ", key = "t", desc = "Treesitter Update", action = ":TSUpdate" },
  { icon = "󱚝 ", key = "m", desc = "Mason", action = ":Mason" },
  { icon = "󰿅 ", key = "q", desc = "Quit", action = ":q" },
}

return {
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      -- ======================================================================
      -- DASHBOARD
      -- ======================================================================
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
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 1, 1 } },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = { 1, 0 } },
          { section = "startup" },
        },
      },

      -- ======================================================================
      -- FEATURES
      -- ======================================================================
      bigfile = { enabled = true }, -- Better handling of large files
      notifier = { enabled = true }, -- Notifications
      quickfile = { enabled = true }, -- Quick file opening
      statuscolumn = { enabled = true }, -- Enhanced status column
      words = { enabled = true }, -- Word highlighting

      -- ======================================================================
      -- PICKER
      -- ======================================================================
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
      },
    },

    -- ========================================================================
    -- KEYMAPS
    -- ========================================================================
    keys = {
      {
        "<C-p>",
        function()
          Snacks.picker.files({
            hidden = true,
            ignored = true,
            exclude = {
              -- Dependencies
              "**/node_modules/**",
              "vendor/*",

              -- Build outputs
              "dist/.*",
              "build/.*",

              -- Storage and cache
              "storage/*",

              -- IDE
              ".idea/*",

              -- Version control
              ".git/.*",

              -- Media files (performance)
              "*.png",
              "*.jpg",
              "*.jpeg",
            },
          })
        end,
        desc = "Find Files",
      },
      {
        "<C-e>",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
    },
  },
}
