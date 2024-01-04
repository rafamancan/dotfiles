require("lazy").setup({
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	"tpope/vim-commentary",
	"mattn/emmet-vim",
	"nvim-tree/nvim-web-devicons",
	"ellisonleao/gruvbox.nvim",
	"dracula/vim",
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
	"lewis6991/gitsigns.nvim",
	"preservim/vimux",
	"christoomey/vim-tmux-navigator",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = true,
	},
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	{ "zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter" },
	"zbirenbaum/copilot-cmp",
	"onsails/lspkind.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"jwalton512/vim-blade",
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
	},
	{ "mbbill/undotree" },
	{ "windwp/nvim-autopairs" },
	{ "tpope/vim-surround" },
	{ "ThePrimeagen/refactoring.nvim" },
	{
		"phaazon/hop.nvim",
		lazy = true,
	},
	{ "wakatime/vim-wakatime" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "folke/which-key.nvim" },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{ "NvChad/nvim-colorizer.lua" },
	{ "nvimtools/none-ls.nvim" },
	{ "rcarriga/nvim-notify" },
	{ "mrded/nvim-lsp-notify" },
	{ "folke/zen-mode.nvim" },
})
