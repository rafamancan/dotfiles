return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                sync_install = true,
                auto_install = true,
                ensure_installed = { "lua", "javascript", "php", "css" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },

            })
        end
    }
}
