local M = {}

-- Altere este nome para o tema que quiser: "monokai-pro", "nord", "tokyonight", etc.
M.theme = "monokai-pro"

function M.apply()
  local ok, _ = pcall(vim.cmd.colorscheme, M.theme)
  if not ok then
    vim.notify("Tema não encontrado: " .. M.theme, vim.log.levels.ERROR)
  end
end

return M
