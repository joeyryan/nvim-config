-- Also configured in the treesitter.lua dependency array
-- to avoid conflicts with load order
local M = {
  "OXY2DEV/markview.nvim",
  priority = 49,
  -- lazy = false,
}

function M.config()
  require("markview").setup({
    preview = {
      icon_provider = "devicons", -- "mini" or "devicons"
    },
    -- experimental = {
    --   check_rtp_message = false,
    -- },
  })
end

return M
