-- Adds a tab bar with open buffers at top of screen
local M = { "akinsho/bufferline.nvim", version = "*" }

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
  keymap("n", "<leader>1", "<cmd> BufferLineGoTo 1 <CR>", { desc = "Go to buffer 1" })
  keymap("n", "<leader>2", "<cmd> BufferLineGoTo 2 <CR>", { desc = "Go to buffer 2" })
  keymap("n", "<leader>3", "<cmd> BufferLineGoTo 3 <CR>", { desc = "Go to buffer 3" })
  keymap("n", "<leader>4", "<cmd> BufferLineGoTo 4 <CR>", { desc = "Go to buffer 4" })
  keymap("n", "<leader>5", "<cmd> BufferLineGoTo 5 <CR>", { desc = "Go to buffer 5" })
  keymap("n", "<leader>6", "<cmd> BufferLineGoTo 6 <CR>", { desc = "Go to buffer 6" })
  keymap("n", "<leader>7", "<cmd> BufferLineGoTo 7 <CR>", { desc = "Go to buffer 7" })
  keymap("n", "<leader>8", "<cmd> BufferLineGoTo 8 <CR>", { desc = "Go to buffer 8" })
  keymap("n", "<leader>9", "<cmd> BufferLineGoTo 9 <CR>", { desc = "Go to buffer 9" })
  keymap("n", "<leader>0", "<cmd> BufferLineGoTo 0 <CR>", { desc = "Go to buffer 0" })
end

return M
