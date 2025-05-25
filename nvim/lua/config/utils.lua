local M = {}

function M.has_plugin(plugin)
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

function M.safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify("Error loading " .. module .. ": " .. result, vim.log.levels.ERROR)
    return nil
  end
  return result
end

return M
