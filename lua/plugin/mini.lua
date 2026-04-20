local M = {
  "nvim-mini/mini.surround",
  version = false,
  event = "VeryLazy",
  dependencies = {

    { "nvim-mini/mini.ai", version = false },
  },
}

function M.config()
  require("mini.ai").setup()
  require("mini.surround").setup()
end

return M
