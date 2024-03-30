-- A few plugins to enable and configure LSP support
local M = {
  "neovim/nvim-lspconfig",
  -- event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
    {
      "williamboman/mason-lspconfig.nvim",
    },
    {
      "williamboman/mason.nvim",
    },
    {
      "nvim-lua/plenary.nvim",
    },
    {
      "b0o/schemastore.nvim",
    },
    -- {
    --   "ray-x/lsp_signature.nvim",
    -- },
  },
}

M.servers = {
  "clangd",
  "lua_ls",
  "cssls",
  "html",
  -- "tsserver",
  "astro",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "marksman",
  "tailwindcss",
  "csharp_ls",
  "eslint",
  "angularls",
  "omnisharp",
  "terraformls",
}

function M.on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "i", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  -- keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

  -- Modified gi and gr to use Trouble, which is a nicer list view than quickfix
  keymap(bufnr, "n", "gi", "<cmd>lua require('trouble').toggle('lsp_implementations')<cr>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua require('trouble').toggle('lsp_references')<cr>", opts)
end

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

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

function M.config()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })
  require("mason-lspconfig").setup({
    ensure_installed = M.servers,
  })

  local lspconfig = require("lspconfig")
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
    virtual_text = true,
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  -- Setup LSP for each server in the servers list
  for _, server in pairs(M.servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    -- Check lspsettings folder for plugin specific config and load if found
    local require_ok, settings = pcall(require, "plugin.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    -- neodev is a lua specific plugin
    if server == "lua_ls" then
      require("neodev").setup({})
    end

    lspconfig[server].setup(opts)
  end

  -- require("lsp_signature").setup()
end

return M
