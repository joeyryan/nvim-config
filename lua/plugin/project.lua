-- Project management support that integrates with Telescope
local M = {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
}

function M.config()
  require("project_nvim").setup({
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { "pattern" },
    patterns = {
      "package.json",
      ".git",
      "Makefile",
      -- "package.json",
    },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = false,
    scope_chdir = "global",
  })

  -- local opts = { noremap = true, silent = true }
  -- local keymap = vim.api.nvim_set_keymap

  -- keymap("n", "<c-p>", ":lua require('telescope').extensions.projects.projects()<CR>", opts)
end

return M
