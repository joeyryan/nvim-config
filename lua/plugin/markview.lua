-- Markdown preview with fancy rendering
local M = {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    preview = {
      icon_provider = "devicons",
    },
  },
}

return M
