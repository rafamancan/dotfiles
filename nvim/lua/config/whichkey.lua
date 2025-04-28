local wk = require("which-key")

wk.add({
  { "<leader>h", group = "[H]arpoon" },
  { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "[A]dd file Harpoon" },
  { "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[L]ist Harpoon" },

  { "<leader>c", group = "[C]ode" },
  { "<leader>cu", "g~", desc = "[C]ode [U]ppercase", mode = { "v" } },
  { "<leader>cl", "gu", desc = "[C]ode [L]owercase", mode = { "v" } },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "[C]ode [A]ction" },
  { "<leader>cn", '<cmd>let @+ = expand("%")<CR>', desc = "[C]opy [F]ile Name" },
  { "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', desc = "[C]opy File [P]ath" },

  { "<leader>t", group = "[T]oggle" },
  { "<leader>ta", "<cmd>AerialToggle<CR>", desc = "[A]erial" },

  { "<leader>a", group = "[A]I" },
  { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Chat [A]I" },
  { "<leader>ax", "<cmd>AvanteAsk Explique este código:<CR>", desc = "[E]xplicar código", mode = { "v" } },
  { "<leader>ar", "<cmd>AvanteAsk Refatore este código:<CR>", desc = "[R]efatorar código", mode = { "v" } },
  { "<leader>af", "<cmd>AvanteAsk Corrija este código:<CR>", desc = "[F]ixar código", mode = { "v" } },
  { "<leader>ag", "<cmd>AvanteAsk Gere código que:<CR>", desc = "[G]erar código" },
  { "<leader>ac", "<cmd>AvanteAsk Complete este código atual:<CR>", desc = "[C]ompletar código" },
  { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "A[P]licar edições sugeridas" },
  { "<leader>au", "<cmd>AvanteRefresh<CR>", desc = "At[U]alizar resposta" },
}, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})
