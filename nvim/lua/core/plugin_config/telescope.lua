require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			-- "--hidden",
			"--glob=!.git/",
		},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<c-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-e>", builtin.buffers, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
