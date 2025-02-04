local wk = require("which-key")

wk.add({
  { "<leader>m", "<cmd>Mason<cr>", desc = "[M]ason" },
  -- { "<leader>q", "<cmd>wqall!<cr>", desc = "[Q]uit" },
  { "<leader>w", "<cmd>w!<cr>", desc = "Save" },
  { "<leader>e", "<cmd>Neotree right reveal toggle<cr>", desc = "[E]xplore Files" },

  { "<leader>t", group = "[T]oggle" },
  { "<leader>to", "<cmd>TodoTrouble<CR>", desc = "T[o]do List" },
  { "<leader>ta", "<cmd>AerialToggle<CR>", desc = "[A]erial" },
  { "<leader>tc", "<cmd>CloakToggle<CR>", desc = "[C]loak" },
  { "<leader>td", "<cmd>Dooing<CR>", desc = "[T]o [D]o" },

  { "<leader>f", group = "[F]ind" },
  { "<leader>f/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },

  { "<leader>h", group = "[H]arpoon" },
  { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "[A]dd file Harpoon" },
  { "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[L]ist Harpoon" },

  { "<leader>x", group = "Trouble Diagnostic" },
  { "<leader>xx", "<cmd>Trouble toggle<cr>", desc = "Trouble Toggle" },
  { "<leader>xw", "<cmd>Trouble toggle workspace_diagnostics<cr>", desc = "[W]orkspace Diagnostic" },
  { "<leader>xd", "<cmd>Trouble toggle diagnostics<cr>", desc = "[D]ocument Diagnostic" },
  { "<leader>xq", "<cmd>Trouble toggle quickfix<cr>", desc = "[Q]uick Fix" },
  { "<leader>xl", "<cmd>Trouble toggle loclist<cr>", desc = "[L]oclist" },
  { "<leader>xr", "<cmd>Trouble toggle lsp_references<cr>", desc = "[R]eferences" },

  { "<leader>c", group = "[C]ode" },
  { "<leader>cu", "g~", desc = "[C]ode [U]ppercase", mode = { "v" } },
  { "<leader>cl", "gu", desc = "[C]ode [L]owercase", mode = { "v" } },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "[C]ode [A]ction" },
  { "<leader>cf", '<cmd>let @+ = expand("%")<CR>', desc = "[C]opy [F]ile Name" },
  { "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', desc = "[C]opy File [P]ath" },

  { "<leader>g", group = "[G]o To" },
  { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "[D]efinition" },
  { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "[I]mplementation" },
  { "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "[R]eferences" },

  { "<leader>l", group = "[L]sp" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "[I]nfo" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "[R]ename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document [S]ymbols" },
  { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "[T]ype Definition" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "[F]ormat" },
  { "<leader>le", "<cmd>LspRestart<cr>", desc = "[R]estart" },
  { "<leader>ly", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace [S]ymbols" },

  { "<leader>O", "<cmd>Oil<CR>", desc = "OIL", mode = { "n", "v" } },
  { "<leader>o", group = "ChatGPT" },
  { "<leader>om", "<cmd>ChatGPT<CR>", desc = "ChatGPT", mode = { "n", "v" } },
  { "<leader>oe", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
  { "<leader>og", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
  { "<leader>ot", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
  { "<leader>ok", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
  { "<leader>od", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
  { "<leader>oa", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
  { "<leader>oo", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
  { "<leader>os", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
  { "<leader>of", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
  { "<leader>ox", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
  { "<leader>or", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
  {
    "<leader>ol",
    "<cmd>ChatGPTRun code_readability_analysis<CR>",
    desc = "Code Readability Analysis",
    mode = { "n", "v" },
  },
}, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})
