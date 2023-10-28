-- works with nvim-navic to provide context about your code in the winbar

local M = {
  "LunarVim/breadcrumbs.nvim",
  commit = "1033b354f65206793831207d5c9047fc059e35c3",
}

function M.config()
  require("breadcrumbs").setup()
end

return M
