local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Window/Pane Navigation handled by nvim-tmux-navigation plugin

-- Buffer Navigation
keymap.set("n", "<TAB>", ":bnext<CR>", opts)
keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts)

-- File Operations
keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Selection
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Search
keymap.set("n", "<c-f>", "<cmd>HopPattern<CR>", { noremap = false })

-- Search and Replace
keymap.set("n", "<leader>rl", ":s//g<LEFT><LEFT>", { desc = "Replace in line" })
keymap.set("n", "<leader>rf", ":%s//g<LEFT><LEFT>", { desc = "Replace in file" })

-- Toggle Options
keymap.set("n", "<leader>wr", ":set wrap!<CR>", { desc = "Toggle wrap" })

-- LSP
keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Rename" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
keymap.set("n", "<leader>ci", "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } } })<CR>", { desc = "Organize Imports" })
keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format Document" })
-- PHPActor specific keybindings
keymap.set("n", "<leader>cu", function()
  vim.lsp.buf.code_action({ filter = function(action)
    return action.title:match("unused") or action.title:match("Unused") or action.title:match("Remove")
  end })
end, { desc = "Remove Unused Code" })

keymap.set("n", "<leader>cm", function()
  vim.lsp.buf.code_action({ filter = function(action)
    return action.title:match("import") or action.title:match("Import") or action.title:match("Add")
  end })
end, { desc = "Add Missing Code" })

-- PHPActor refactoring commands
keymap.set("n", "<leader>pe", "<cmd>lua vim.lsp.buf.code_action({ filter = function(action) return action.title:match('Extract') end })<CR>", { desc = "Extract Method" })
keymap.set("n", "<leader>pg", "<cmd>lua vim.lsp.buf.code_action({ filter = function(action) return action.title:match('Generate') end })<CR>", { desc = "Generate Code" })
keymap.set("n", "<leader>pt", "<cmd>lua vim.lsp.buf.code_action({ filter = function(action) return action.title:match('Transform') end })<CR>", { desc = "Transform Code" })
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-- Terminal
keymap.set("n", "<C-t>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
keymap.set("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", { desc = "Toggle Terminal from terminal mode" })

-- Visual Mode Enhancements
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Paste without overwriting register
keymap.set("v", "p", '"_dP', opts)

-- Move selected text
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Text Editing
keymap.set("n", "dw", 'vb"_d', { desc = "Delete word backwards" })

-- Load which-key mappings
require("config/whichkey")