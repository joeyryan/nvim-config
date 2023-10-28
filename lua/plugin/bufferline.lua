local M = { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' }

function M.config()
  require("bufferline").setup {
    options = {
      tab_size = 20,
    }
  }
end

return M
