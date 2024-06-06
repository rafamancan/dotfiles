local wk = require("which-key")

wk.register({
  ["m"] = { "<cmd>Mason<CR>", "[M]ason" },
  ["L"] = { "<cmd>Lazy<CR>", "[P]lugin Manager" },
  ["q"] = { "<cmd>wqall!<CR>", "[Q]uit" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["R"] = { "<cmd>lua require('refactoring').select_refactor()<CR>", "[R]efactor" },
  ["U"] = { "<cmd>lua require('undotree').toggle()<cr>", "[U]ndo tree" },
  ["e"] = { "<cmd>Neotree right reveal toggle<CR>", "[E]xplore Files" },
  ["D"] = "which_key_ignore",
  ["C"] = { "<cmd>:%s/\r//g<CR>", "[C]lear ^M" },
  t = {
    name = "[T]oggle",
    ["o"] = { "<cmd>TodoTrouble<CR>", "T[o]do List" },
    ["a"] = { "<cmd>AerialToggle<CR>", "[A]erial" },
    ["c"] = { "<cmd>CloakToggle<CR>", "[C]loak" },
  },
  f = {
    name = "[F]ind",
    ["/"] = { "<cmd>Telescope live_grep<cr>", "Find Grep" },
  },
  h = {
    name = "[H]arpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "[A]dd file Harpoon" },
    l = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "[L]ist Harpoon" },
  },
  x = {
    name = "Trouble Diagnostic",
    x = { "<cmd>Trouble toggle<cr>", "Trouble Toggle" },
    w = { "<cmd>Trouble toggle workspace_diagnostics<cr>", "[W]orkspace Diagnostic" },
    d = { "<cmd>Trouble toggle diagnostics<cr>", "[D]ocument Diagnostic" },
    q = { "<cmd>Trouble toggle quickfix<cr>", "[Q]uick Fix" },
    l = { "<cmd>Trouble toggle loclist<cr>", "[L]oclist" },
    r = { "<cmd>Trouble toggle lsp_references<cr>", "[R]eferences" },
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
  o = {
    name = "ChatGPT",
    m = { "<cmd>ChatGPT<CR>", "ChatGPT", mode = { "n", "v" } },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
  },
}, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})
