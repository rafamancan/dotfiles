local wk = require("which-key")

wk.add({
  { "<leader>h", group = "[H]arpoon" },
  { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "[A]dd file Harpoon" },
  { "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[L]ist Harpoon" },

  { "<leader>c", group = "[C]ode" },
  { "<leader>cu", "g~", desc = "[C]ode [U]ppercase", mode = { "v" } },
  { "<leader>cl", "gu", desc = "[C]ode [L]owercase", mode = { "v" } },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "[C]ode [A]ction" },
  { "<leader>cf", '<cmd>let @+ = expand("%")<CR>', desc = "[C]opy [F]ile Name" },
  { "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', desc = "[C]opy File [P]ath" },
}, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})
