-- Adds a tab bar with open buffers at top of screen
local M = {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
}

function M.config()
  require("bufferline").setup({
    options = {
      tab_size = 20,
      separator_style = "slant",
    },
  })

  local keymap = vim.api.nvim_set_keymap
  keymap("n", "<tab>", "<cmd> BufferLineCycleNext <CR>", { desc = "Go to next bufferline in order" })
  keymap("n", "<S-tab>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Go to previous bufferline in [order" })

  for i = 0, 9 do
    keymap("n", "<leader>" .. i, "<cmd>BufferLineGoTo " .. i .. " <cr>", { desc = "Go to buffer " .. i })
  end
end

return M
