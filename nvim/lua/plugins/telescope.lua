-- ============================================================================
-- TELESCOPE CONFIGURATION
-- ============================================================================
-- Optimizations for fuzzy finding and LSP references display.
-- ============================================================================

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        -- Faster sorting algorithm
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        -- Limit results for better performance
        file_ignore_patterns = {
          "node_modules",
          "%.git/",
          "vendor/*/tests/",
          "vendor/*/Tests/",
          "vendor/*/test/",
          "vendor/*/docs/",
          "vendor/*/doc/",
          "vendor/*/examples/",
          "storage/",
          "cache/",
        },
        -- Performance optimizations
        cache_picker = {
          num_pickers = 3, -- Cache last 3 pickers
        },
        -- Faster file operations
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim", -- Trim whitespace
        },
        -- Disable preview for large files
        preview = {
          filesize_limit = 0.5, -- MB
          timeout = 250, -- ms
        },
      },
      pickers = {
        -- Optimize LSP references picker
        lsp_references = {
          show_line = false, -- Don't show full line content (faster)
          trim_text = true, -- Trim whitespace
          fname_width = 50, -- Limit filename width
          include_current_line = false, -- Don't include current line
          -- Jump immediately if only one result
          jump_type = "never", -- Don't automatically jump
        },
        -- Optimize LSP document symbols
        lsp_document_symbols = {
          symbol_width = 50,
        },
        -- Optimize find files
        find_files = {
          hidden = false, -- Don't search hidden files by default
          follow = false, -- Don't follow symlinks
        },
        -- Optimize live grep
        live_grep = {
          only_sort_text = true, -- Faster sorting
          -- Limit initial results
          max_results = 1000,
        },
      },
    },
  },
}
