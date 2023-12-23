return {
    'numToStr/Comment.nvim',
    opts = {
    },
    config = function()
        require("Comment").setup({
            toggler = {
                line = '/',
                block = '/',
            },
        })
    end,
    lazy = false,
}
