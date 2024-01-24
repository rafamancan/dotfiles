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
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
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
