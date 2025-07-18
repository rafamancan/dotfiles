return {
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionToggle", "CodeCompanionActions" },
    opts = {
      strategies = {
        chat = {
          name = "copilot",
          -- model = "claude-sonnet-4-20250514",
        },
        inline = {
          adapter = "anthropic",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
  },
}
-- return {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   version = false, -- Never set this value to "*"! Never!
--   opts = {
--     provider = "claude",
--     claude = {
--       endpoint = "https://api.anthropic.com",
--       model = "claude-3-5-sonnet-20241022",
--       timeout = 30000, -- Timeout in milliseconds
--       temperature = 0,
--       max_tokens = 4096,
--       disable_tools = true, -- disable tools!
--     },
--     prompts = {
--       default_system = [[
--           Você é um assistente de programação que ajuda a escrever, explicar, refatorar e corrigir código.
--           Seja conciso e direto nas suas respostas. Priorize qualidade e boas práticas de código.
--         ]],
--     },
--   },
--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   build = "make",
--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "echasnovski/mini.pick", -- for file_selector provider mini.pick
--     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
--     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
--     "ibhagwan/fzf-lua", -- for file_selector provider fzf
--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--     "zbirenbaum/copilot.lua", -- for providers='copilot'
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       "MeanderingProgrammer/render-markdown.nvim",
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }
