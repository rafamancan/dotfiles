-- ============================================================================
-- LSP CONFIGURATION OVERRIDES
-- ============================================================================
-- Optimizations and overrides for LazyVim's default LSP behavior.
-- ============================================================================

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Disable the annoying "Finding references is taking a while" confirmation
      -- by increasing the threshold or removing the limit entirely
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.update_in_insert = false -- Don't update diagnostics while typing

      -- Optimize all LSP servers globally
      opts.servers = opts.servers or {}

      -- Set default capabilities for all servers
      local default_capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false, -- Disable file watching globally
          },
        },
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true,
              resolveSupport = {
                properties = { "documentation", "detail", "additionalTextEdits" },
              },
            },
          },
        },
      }

      -- Apply to all servers
      for server, config in pairs(opts.servers) do
        if type(config) == "table" then
          config.capabilities = vim.tbl_deep_extend("force", default_capabilities, config.capabilities or {})
        end
      end

      return opts
    end,
    init = function()
      -- Override the default LSP reference handler to disable confirmation prompts
      local function goto_definition(split_cmd)
        local util = vim.lsp.util
        local log = require("vim.lsp.log")
        local api = vim.api

        local handler = function(_, result, ctx)
          if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, "No location found")
            return nil
          end

          if split_cmd then
            vim.cmd(split_cmd)
          end

          if vim.tbl_islist(result) then
            -- Jump directly without confirmation, even for multiple results
            util.jump_to_location(result[1], "utf-8")

            if #result > 1 then
              -- If there are multiple results, show them in quickfix
              -- but don't prompt the user
              util.set_qflist(util.locations_to_items(result, "utf-8"))
              api.nvim_command("copen")
            end
          else
            util.jump_to_location(result, "utf-8")
          end
        end

        return handler
      end

      -- Override handlers to remove confirmation prompts
      vim.lsp.handlers["textDocument/definition"] = goto_definition()
      vim.lsp.handlers["textDocument/declaration"] = goto_definition()
      vim.lsp.handlers["textDocument/typeDefinition"] = goto_definition()
      vim.lsp.handlers["textDocument/implementation"] = goto_definition()

      -- Override references handler to show results immediately without confirmation
      vim.lsp.handlers["textDocument/references"] = function(_, result, ctx, _)
        if not result or vim.tbl_isempty(result) then
          vim.notify("No references found", vim.log.levels.INFO)
          return
        end

        -- Show results immediately in quickfix without asking
        local items = vim.lsp.util.locations_to_items(result, vim.lsp.get_client_by_id(ctx.client_id).offset_encoding)
        vim.fn.setqflist({}, " ", { title = "LSP References", items = items })
        vim.cmd("copen")
      end

    end,
  },

  -- ==========================================================================
  -- DISABLE TROUBLE FOR REFERENCES (use quickfix instead)
  -- ==========================================================================
  {
    "folke/trouble.nvim",
    optional = true,
    opts = {
      -- Disable automatic opening of trouble for references
      auto_open = false,
      auto_close = false,
      auto_preview = false,
      -- Use quickfix for references instead
      use_diagnostic_signs = true,
    },
  },
}
