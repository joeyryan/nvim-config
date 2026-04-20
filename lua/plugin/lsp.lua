-- LSP configuration and related plugins

-- Server list (exported for mason.lua to use)
local servers = {
  "kotlin_lsp",
  "phpactor",
  "clangd",
  "lua_ls",
  "cssls",
  "html",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "marksman",
  "tailwindcss",
  "eslint",
  "angularls",
  "omnisharp",
  "terraformls",
  "rust_analyzer",
  "asm_lsp",
  "cmake",
}

local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({ max_width = 100, wrap = true, border = 'single' })<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  -- Modified gi and gr to use Trouble, which is a nicer list view than quickfix
  keymap(bufnr, "n", "gi", "<cmd>lua require('trouble').toggle('lsp_implementations')<cr>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua require('trouble').toggle('lsp_references')<cr>", opts)
end

local function common_capabilities()
  local status_ok, blink = pcall(require, "blink.cmp")
  if status_ok then
    return blink.get_lsp_capabilities()
  end

  -- Fallback when blink is not yet loaded
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  return capabilities
end

local function config()
  local icons = require("core.icons")

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.BoldHint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.BoldInformation },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "single",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  -- Setup LSP for each server
  for _, server in pairs(servers) do
    local opts = {
      on_attach = on_attach,
      capabilities = common_capabilities(),
    }

    -- Check lspsettings folder for plugin specific config and load if found
    local require_ok, settings = pcall(require, "plugin.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    -- Use the new vim.lsp.config instead of nvim-lspconfig
    vim.lsp.config[server] = opts
    vim.lsp.enable(server)
  end
end

-- Return plugin specs as an array (for lazy.nvim import)
-- Also attach servers list so mason.lua can access it
local specs = {
  -- Core LSP plugin (only needed for Neovim < 0.11)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = config,
  },

  -- Neodev for Lua development
  {
    "folke/neodev.nvim",
    ft = "lua",
  },

  -- LazyDev for lazy-loading Neovim Lua API
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },

  -- Schemastore for JSON schemas
  {
    "b0o/schemastore.nvim",
    ft = "json",
  },
}

-- Attach servers to the specs array so mason.lua can access via require("plugin.lsp").servers
specs.servers = servers

return specs
