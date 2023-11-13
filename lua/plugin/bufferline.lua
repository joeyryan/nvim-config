local M = { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' }

function M.config()
  require("bufferline").setup {
    options = {
      tab_size = 20,
    }
  }

  local keymap = vim.api.nvim_set_keymap
  keymap('n', '<tab>', "<cmd> BufferLineCycleNext <CR>", { desc = 'Go to next bufferline in order' })
  keymap('n', '<S-tab>', "<cmd> BufferLineCyclePrev <CR>", { desc = 'Go to previous bufferline in [order' })
end

return M
