local M = {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  opts = {
    -- options
    -- Options related to integrating with other plugins
    integration = {
      ["nvim-tree"] = { enable = true },
    },
  },
}

return M
