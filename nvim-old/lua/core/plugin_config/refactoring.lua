vim.keymap.set({ "n", "x" }, "<leader>r", function()
	require("refactoring").select_refactor()
end)
