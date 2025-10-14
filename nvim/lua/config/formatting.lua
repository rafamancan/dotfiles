-- Configuração de formatação customizada
local M = {}

-- Formata arquivo PHP usando php-cs-fixer + phpcbf (igual composer fix)
function M.format_php()
  local buf = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(buf)
  local pos = vim.api.nvim_win_get_cursor(0)

  -- Salvar o arquivo primeiro
  vim.cmd("write")

  -- Encontrar o root do projeto
  local root = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";")
  if root == "" then
    root = vim.fn.getcwd()
  end

  -- Executar php-cs-fixer
  local cmd1 = string.format(
    "cd %s && vendor/bin/php-cs-fixer fix --using-cache=no %s 2>&1",
    vim.fn.shellescape(root),
    vim.fn.shellescape(filepath)
  )
  vim.fn.system(cmd1)

  -- Executar phpcbf (PSR12)
  local cmd2 = string.format(
    "cd %s && vendor/bin/phpcbf --standard=PSR12 %s 2>&1",
    vim.fn.shellescape(root),
    vim.fn.shellescape(filepath)
  )
  vim.fn.system(cmd2)

  -- Recarregar o arquivo
  vim.cmd("edit!")

  -- Restaurar posição do cursor
  pcall(vim.api.nvim_win_set_cursor, 0, pos)

  print("✓ Formatted with php-cs-fixer + phpcbf")
end

-- Formata o buffer atual baseado no filetype
function M.format_buffer()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype

  if ft == "php" then
    M.format_php()
  else
    -- Para outras linguagens, usar o default do LazyVim (LSP)
    vim.lsp.buf.format({ timeout_ms = 10000, async = false })
  end
end

return M
