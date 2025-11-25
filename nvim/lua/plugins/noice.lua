-- ============================================================================
-- NOICE.NVIM CONFIGURATION
-- ============================================================================
-- Rounded borders for hover and other floating windows.
-- ============================================================================

return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- Add border to hover docs and signature help
      },
    },
  },
}
