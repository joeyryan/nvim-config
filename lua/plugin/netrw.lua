-- Adds icons to netrw
local M = {
  "prichrd/netrw.nvim",
  event = "VeryLazy",
}

function M.config()
  local icons = require("core.icons")
  require("netrw").setup({
    icons = {
      symlink = icons.ui.Forward,
      directory = icons.ui.FolderOpen,
      -- file = " ",
      file = icons.ui.File,
    },
    use_devicons = true,
    mappings = {},
  })
end

return M
