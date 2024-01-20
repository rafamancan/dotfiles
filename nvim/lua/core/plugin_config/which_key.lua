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
	["e"] = { "<cmd>Neotree right reveal toggle<CR>", "[E]xplore Files" },
	["s"] = { "<cmd>so %<CR>", "[S]ource file config" },
	["z"] = { "<cmd>ZenMode<CR>", "[Z]en ^^" },
	["D"] = "which_key_ignore",
	x = {
		name = "Trouble Diagnostic",
		x = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "[W]orkspace Diagnostic" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "[D]ocument Diagnostic" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "[Q]uick Fix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "[L]oclist" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "[R]eferences" },
	},
	c = {
		name = "[C]ode",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction" },
	},
	g = {
		name = "[G]oTo",
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "[D]eclaration" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "[D]efinition" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "[I]mplementation" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "[R]eferences" },
	},
	-- Language Support
	l = {
		name = "[L]SP",
		i = { "<cmd>LspInfo<cr>", "[I]nfo" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "[R]ename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document [S]ymbols" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "[T]ype Definition" },
		f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "[F]ormat" },
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
