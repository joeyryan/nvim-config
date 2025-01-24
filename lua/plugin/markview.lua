-- Adds icons to netrw
local M = {
  "OXY2DEV/markview.nvim",
  lazy = false,
  opts = {
    preview = {
      icon_provider = "devicons", -- "mini" or "devicons"
    },
  },
}

function M.config() end

return M
