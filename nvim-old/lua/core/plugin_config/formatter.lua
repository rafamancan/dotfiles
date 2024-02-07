require("conform").setup({
	format = {
		timeout_ms = 3000,
		async = false, -- not recommended to change
		quiet = false, -- not recommended to change
	},
	formatters_by_ft = {
		lua = { "stylua" },
		php = { "php-cs-fixer" },
		blade = { "blade-formatter" },
		javascript = { "prettierd" },
	},
	formatters = {
		injected = { options = { ignore_errors = true } },
	},
})
