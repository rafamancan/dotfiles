-- ============================================================================
-- NOICE.NVIM CONFIGURATION
-- ============================================================================
-- Rounded borders for hover and other floating windows.
-- ============================================================================

return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = {
          silent = true, -- Don't show "No information available" notification
        },
      },
      presets = {
        lsp_doc_border = true, -- Add border to hover docs and signature help
      },
    },
  },
}
