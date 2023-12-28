local wk = require("which-key")

wk.setup({
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
})

wk.register({
	["d"] = { "<cmd>Dashboard<CR>", "[D]ashboard" },
	["m"] = { "<cmd>Mason<CR>", "[M]ason" },
	["L"] = { "<cmd>Lazy<CR>", "[P]lugin Manager" },
	["q"] = { "<cmd>wqall!<CR>", "[Q]uit" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["r"] = { "<cmd>lua require('refactoring').select_refactor()<CR>", "[R]efactor" },
	["f"] = { "<cmd>HopPattern<CR>", "[F]ind in file" },
	["u"] = { "<cmd>UndoTreeToggle<CR>", "[U]ndo tree" },
	["e"] = { "<cmd>Neotree reveal toggle<CR>", "[E]xplore Files" },
	["s"] = { "<cmd>so %<CR>", "[S]ource file config" },
	["D"] = "which_key_ignore",
	c = {
		name = "[C]ode",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction" },
	},
	-- Language Support
	l = {
		name = "[L]SP",
		i = { "<cmd>LspInfo<cr>", "[I]nfo" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "[R]ename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document [S]ymbols" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "[T]ype Definition" },
		f = { "<cmd>lua require('conform').format()<cr>", "[F]ormat" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace [S]ymbols",
		},
	},
}, {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
})
