-- Adds icons to netrw
local M = {
  "OXY2DEV/markview.nvim",
  lazy = false,
  opts = {
    preview = {
      icon_provider = "devicons", -- "mini" or "devicons"
    },
    experimental = {
      check_rtp_message = false,
    },
  },
}

function M.config() end

return M
