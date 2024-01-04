require("telescope").setup({ file_ignore_patterns = { "node%_modules/.*" } })
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<c-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-e>", builtin.buffers, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
