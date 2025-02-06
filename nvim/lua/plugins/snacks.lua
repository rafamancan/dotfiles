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
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
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
    },
  },
}
