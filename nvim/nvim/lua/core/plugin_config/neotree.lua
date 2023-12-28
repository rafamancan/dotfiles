require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		width = 30,
	},
	buffers = {
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
	},
	filesystem = {
		follow_current_file = {
			enbaled = true,
			leave_dirs_open = false,
		},
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				"node_modules",
				"vendor",
			},
			never_show = {
				".DS_Store",
				"thumbs.db",
			},
		},
	},
})

vim.keymap.set("n", "<leader>e", ":Neotree reveal toggle <CR>", { noremap = true, silent = true })
