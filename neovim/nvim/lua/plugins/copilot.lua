return {
    {
        "nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    keymap = {
                        accept = "<c-l>",
                        next = "<c-j>",
                        prev = "<c-k>",
                        dismiss = "<c-h>",
                    },
                },
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup({
                suggestion = { enabled = true },
                panel = { enabled = false },
            })
        end,
    },
}
