-- A few plugins to enable and configure LSP support
local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
    },
  },
}

-- Load server list from lsp.lua
M.servers = require("plugin.lsp").servers

function M.config()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
    ensure_installed = M.servers,
  })
  require("mason-lspconfig").setup({
    ensure_installed = M.servers,
  })
end

return M
