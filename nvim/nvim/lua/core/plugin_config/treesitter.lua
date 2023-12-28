require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"php",
		"python",
		"query",
		"regex",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	sync_install = true,
	auto_install = true,
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
		filetypes = { "html", "xml", "blade" },
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
