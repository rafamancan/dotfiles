-- ============================================================================
-- CUSTOM FORMATTING CONFIGURATION
-- ============================================================================
-- Custom formatting logic for different filetypes.
-- PHP uses php-cs-fixer, others use LSP formatting.
-- ============================================================================

local M = {}

-- ============================================================================
-- PHP FORMATTING
-- ============================================================================
--- Formats PHP file using php-cs-fixer (matches `composer fix` command)
--- This runs synchronously and preserves cursor position.
function M.format_php()
  local buf = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(buf)
  local pos = vim.api.nvim_win_get_cursor(0)

  -- Save file first to ensure formatters work on latest content
  vim.cmd("write")

  -- Find project root (directory containing .git)
  local root = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";")
  if root == "" then
    root = vim.fn.getcwd()
  end

  -- Run php-cs-fixer
  local cmd = string.format(
    "cd %s && vendor/bin/php-cs-fixer fix --using-cache=no %s 2>&1",
    vim.fn.shellescape(root),
    vim.fn.shellescape(filepath)
  )
  local output = vim.fn.system(cmd)

  -- Check for errors
  if vim.v.shell_error ~= 0 then
    vim.notify("php-cs-fixer error:\n" .. output, vim.log.levels.ERROR)
    return
  end

  -- Reload file to show changes
  vim.cmd("edit!")

  -- Restore cursor position (use pcall to avoid errors if position is invalid)
  pcall(vim.api.nvim_win_set_cursor, 0, pos)

  vim.notify("✓ Formatted with php-cs-fixer", vim.log.levels.INFO)
end

-- ============================================================================
-- GENERAL FORMATTING
-- ============================================================================
--- Formats current buffer based on filetype.
--- PHP: uses php-cs-fixer
--- Others: uses LSP formatting
function M.format_buffer()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype

  if ft == "php" then
    M.format_php()
  else
    -- Use LSP formatting for other languages
    vim.lsp.buf.format({ timeout_ms = 10000, async = false })
  end
end

return M
