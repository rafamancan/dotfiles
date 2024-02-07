local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.formatting.blade_formatter,
	},
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
vim.keymap.set("i", "<Tab>", vim.lsp.buf.completion, {})
