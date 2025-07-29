-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        -- Harpoon
        { '<leader>H', group = '[H]arpoon' },
        { '<leader>Ha', "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = '[A]dd file Harpoon' },
        { '<leader>Hl', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = '[L]ist Harpoon' },

        -- Code actions
        { '<leader>c', group = '[C]ode' },
        { '<leader>cu', 'g~', desc = '[C]ode [U]ppercase', mode = { 'v' } },
        { '<leader>cl', 'gu', desc = '[C]ode [L]owercase', mode = { 'v' } },
        { '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = '[C]ode [A]ction' },
        { '<leader>cn', '<cmd>let @+ = expand("%")<CR>', desc = '[C]opy [F]ile Name' },
        { '<leader>cp', '<cmd>let @+ = expand("%:p")<CR>', desc = '[C]opy File [P]ath' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
