local lsp_zero = require("lsp-zero")
local cmp = require('cmp')
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lspkind = require("lspkind")
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local cmp_action = lsp_zero.cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

lsp_zero.preset("recommended")

-- Fix Undefined global 'vim'
lsp_zero.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = "copilot" },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer',  keyword_length = 4 },
    }),

})

lspkind.init({
    symbol_map = {
        Copilot = "",
    },
})
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

---@diagnostic disable-next-line: unused-local
lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = { 'tsserver', 'intelephense', 'lua_ls', 'cssls' },
    handlers = {
        lsp_zero.default_setup,
    },
})

local handlers = {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
}

require("mason-lspconfig").setup_handlers(handlers)

lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
