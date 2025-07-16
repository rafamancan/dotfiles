local wk = require("which-key")

wk.add({
  -- Search
  { "<leader>h", ":nohlsearch<CR>", desc = "Clear search highlight" },

  -- Harpoon
  { "<leader>H", group = "[H]arpoon" },
  { "<leader>Ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "[A]dd file Harpoon" },
  { "<leader>Hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[L]ist Harpoon" },

  -- Code actions
  { "<leader>c", group = "[C]ode" },
  { "<leader>cu", "g~", desc = "[C]ode [U]ppercase", mode = { "v" } },
  { "<leader>cl", "gu", desc = "[C]ode [L]owercase", mode = { "v" } },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "[C]ode [A]ction" },
  { "<leader>cn", '<cmd>let @+ = expand("%")<CR>', desc = "[C]opy [F]ile Name" },
  { "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', desc = "[C]opy File [P]ath" },

  -- Toggle options
  { "<leader>t", group = "[T]oggle" },
  { "<leader>ta", "<cmd>AerialToggle<CR>", desc = "[A]erial" },

  -- AI (disabled by default)
  { "<leader>a", group = "[A]I" },
  -- { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Chat [A]I" },
  -- { "<leader>ax", "<cmd>AvanteAsk Explique este código:<CR>", desc = "[E]xplicar código", mode = { "v" } },
  -- { "<leader>ar", "<cmd>AvanteAsk Refatore este código:<CR>", desc = "[R]efatorar código", mode = { "v" } },
  -- { "<leader>af", "<cmd>AvanteAsk Corrija este código:<CR>", desc = "[F]ixar código", mode = { "v" } },
  -- { "<leader>ag", "<cmd>AvanteAsk Gere código que:<CR>", desc = "[G]erar código" },
  -- { "<leader>ac", "<cmd>AvanteAsk Complete este código atual:<CR>", desc = "[C]ompletar código" },
  -- { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "A[P]licar edições sugeridas" },
  -- { "<leader>au", "<cmd>AvanteRefresh<CR>", desc = "At[U]alizar resposta" },

  { "<leader>ac", "<cmd>CodeCompanionToggle<CR>", { desc = "Toggle CodeCompanion" } },
  { "<leader>aa", "<cmd>CodeCompanionActions<CR>", { desc = "CodeCompanion Actions" } },
  { "<leader>aa", "<cmd>CodeCompanionActions<CR>", { desc = "CodeCompanion Actions" } },
  { "<leader>ah", "<cmd>CodeCompanionChat<CR>", { desc = "CodeCompanion Chat" } },
  { "<leader>a<CR>", "<cmd>CodeCompanion<CR>", { desc = "CodeCompanion" } },
}, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

