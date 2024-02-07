require("hop").setup({ keys = "etovxqpdygfblzhckisuran", term_seq_bias = 0.5 })

-- Changing the default f keyword
-- vim.api.nvim_set_keymap('n', '<C-e>', "<cmd>lua require'hop'.hint_char1()<cr>", {})

-- Pattern Matching with t keyword
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>HopPattern<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>HopPattern<CR>", { noremap = true })
