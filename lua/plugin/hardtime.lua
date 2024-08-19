local M = {
   "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
   opts = {}
}

function M.config()
  require("hardtime").setup()
end

return M
