require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
	},
	options = {
		integrations = {
			cmp = true,
			dashboard = true,
			gitsigns = true,
			headlines = true,
			illuminate = true,
			lsp_trouble = true,
			mason = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			navic = { enabled = true, custom_bg = "lualine" },
			neotree = true,
			noice = true,
			notify = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
			which_key = true,
		},
	},
})

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme catppuccin]])
