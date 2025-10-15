-- ============================================================================
-- CODING PLUGINS CONFIGURATION
-- ============================================================================
-- Enhanced editing and coding assistance plugins.
-- ============================================================================

return {
  -- ==========================================================================
  -- MINI.SURROUND - Surround text with quotes, brackets, etc.
  -- ==========================================================================
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "<leader>sa", -- Add surrounding
        delete = "<leader>sd", -- Delete surrounding
        find = "gsf", -- Find surrounding to the right
        find_left = "gsF", -- Find surrounding to the left
        highlight = "gsh", -- Highlight surrounding
        replace = "<leader>sr", -- Replace surrounding
        update_n_lines = "gsn", -- Update n_lines
      },
    },
  },
}

