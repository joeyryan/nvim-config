local M = {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "InsertEnter",
  version = "*",
}

function M.config()
  vim.cmd("Copilot disable") -- Ensure Copilot is off by default
end

return M
