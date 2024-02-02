local wk = require("which-key")

wk.setup({
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
})

wk.register({
	["m"] = { "<cmd>Mason<CR>", "[M]ason" },
	["L"] = { "<cmd>Lazy<CR>", "[P]lugin Manager" },
	["q"] = { "<cmd>wqall!<CR>", "[Q]uit" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["r"] = { "<cmd>lua require('refactoring').select_refactor()<CR>", "[R]efactor" },
	["f"] = { "<cmd>HopPattern<CR>", "[F]ind in file" },
	["u"] = { "<cmd>lua require('undotree').toggle()<cr>", "[U]ndo tree" },
	["e"] = { "<cmd>Neotree right reveal toggle<CR>", "[E]xplore Files" },
	["z"] = { "<cmd>ZenMode<CR>", "[Z]en ^^" },
	["D"] = "which_key_ignore",
	["t"] = { "<cmd>TodoTrouble<CR>", "[T]odo List" },
	h = {
		name = "[H]arpoon",
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "[A]dd file Harpoon" },
		l = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "[L]ist Harpoon" },
	},
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
		f = { '<cmd>let @+ = expand("%")<CR>', "[C]opy [F]ile Name" },
		p = { '<cmd>let @+ = expand("%:p")<CR>', "[C]opy File [P]ath" },
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
		R = { "<cmd>LspRestart<cr>", "[R]estart" },
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
