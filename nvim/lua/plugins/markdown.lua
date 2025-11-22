-- ============================================================================
-- MARKDOWN PLUGINS CONFIGURATION
-- ============================================================================
-- Markdown editing and preview plugins.
-- ============================================================================

return {
  -- ==========================================================================
  -- MARKDOWN PREVIEW - Live preview in browser
  -- ==========================================================================
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown: Toggle preview",
      },
    },
    config = function()
      -- Plugin configuration
      vim.g.mkdp_auto_start = 0 -- Don't auto-start preview
      vim.g.mkdp_auto_close = 1 -- Auto-close preview when changing buffer
      vim.g.mkdp_refresh_slow = 0 -- Auto-refresh on buffer write
      vim.g.mkdp_command_for_global = 0 -- Only available for markdown files
      vim.g.mkdp_open_to_the_world = 0 -- Server only accessible locally
      vim.g.mkdp_browser = "" -- Use system default browser
      vim.g.mkdp_echo_preview_url = 1 -- Echo preview URL in command line
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {},
      }
    end,
  },
}
