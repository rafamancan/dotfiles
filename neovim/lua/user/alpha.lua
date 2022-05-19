local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
[[                                            ]],
[[ _ __ _ __ ___   __ _ _ __   ___ __ _ _ __  ]],
[[| '__| '_ ` _ \ / _` | '_ \ / __/ _` | '_ \ ]],
[[| |  | | | | | | (_| | | | | (_| (_| | | | |]],
[[|_|  |_| |_| |_|\__,_|_| |_|\___\__,_|_| |_|]],
[[                                            ]],
[[                                            ]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Neovim Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("z", "  ZSH Configuration", ":e ~/.zshrc <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "Rafael Mançan"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)