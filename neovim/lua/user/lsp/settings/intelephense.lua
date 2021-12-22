

local util = require 'lspconfig.util'

local bin_name = 'intelephense'
local cmd = { bin_name, '--stdio' }

local opts = { silent=true }

-- Php specific key maps.
vim.api.nvim_set_keymap('x', '<leader>em',
    [[:<C-U>call phpactor#ExtractMethod(visualmode())<CR>]],
    opts
)
vim.api.nvim_set_keymap('x', '<leader>ee',
    [[:<C-U>call phpactor#ExtractExpression(visualmode())<CR>]],
    opts
)
vim.api.nvim_set_keymap('n', '<leader>pt',
    [[:call phpactor#Transform()<CR>]],
    opts
)
vim.api.nvim_set_keymap('n', '<leader>pce',
    [[:call phpactor#ClassExpand()<CR>]],
    opts
)
vim.api.nvim_set_keymap('n', '<leader>pp',
    [[:call phpactor#ContextMenu()<CR>]],
    opts
)

-- make $ part of the keyword.
vim.api.nvim_exec(
[[
autocmd FileType php set iskeyword+=$
]],
false
)

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, '--stdio' }
end

return {
  default_config = {
    cmd = cmd,
    filetypes = { 'php' },
    root_dir = function(pattern)
      local cwd = vim.loop.cwd()
      local root = util.root_pattern('composer.json', '.git')(pattern)

      -- prefer cwd if root is a descendant
      return util.path.is_descendant(cwd, root) and cwd or root
    end,
  },
  docs = {
    description = [[
https://intelephense.com/
`intelephense` can be installed via `npm`:
```sh
npm install -g intelephense
```
]],
    default_config = {
      package_json = 'https://raw.githubusercontent.com/bmewburn/vscode-intelephense/master/package.json',
      root_dir = [[root_pattern("composer.json", ".git")]],
      init_options = [[{
        storagePath = Optional absolute path to storage dir. Defaults to os.tmpdir().
        globalStoragePath = Optional absolute path to a global storage dir. Defaults to os.homedir().
        licenceKey = Optional licence key or absolute path to a text file containing the licence key.
        clearCache = Optional flag to clear server state. State can also be cleared by deleting {storagePath}/intelephense
        -- See https://github.com/bmewburn/intelephense-docs/blob/master/installation.md#initialisation-options
      }]],
      settings = [[{
        intelephense = {
          files = {
            maxSize = 1000000;
          };
        };
        -- See https://github.com/bmewburn/intelephense-docs
      }]],
    },
  },
}
-- local lspconfig = require'lspconfig'
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   }
-- }

