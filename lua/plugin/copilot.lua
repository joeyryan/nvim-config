local M = {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "InsertEnter",
  version = "*",
}

function M.config()
  vim.cmd("Copilot disable") -- Ensure Copilot is off by default
  -- vim.keymap.set("n", "<leader>e", ":Copilot enable<CR>", { desc = "Enable copilot" })

  -- Variable to track Copilot state
  local copilot_enabled = false

  -- Function to toggle Copilot
  local function toggle_copilot()
    if copilot_enabled then
      vim.cmd("Copilot disable")
      copilot_enabled = false
      print("Copilot disabled")
    else
      vim.cmd("Copilot enable")
      copilot_enabled = true
      print("Copilot enabled")
    end
  end

  -- Map the function to a keybinding
  vim.keymap.set("n", "<leader>\\g", toggle_copilot, { desc = "Toggle Copilot" })
end

return M
