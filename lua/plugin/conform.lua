-- Formats code on save
local M = {
  "stevearc/conform.nvim",
  opts = {},
}

function M.config()
  require("conform").setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      sh = { "shfmt" },
      python = { "black" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 2000,
      lsp_fallback = true,
      async = false,
      quiet = false,
    },
  })
  --vim.api.nvim_create_autocmd("BufWritePre", {
  --	pattern = "*",
  --	callback = function(args)
  --		require("conform").format({ bufnr = args.buf })
  --	end,
  --})

  require("conform").formatters.shfmt = {
    prepend_args = { "-i", "2" },
    -- The base args are { "-filename", "$FILENAME" } so the final args will be
    -- { "-i", "2", "-filename", "$FILENAME" }
  }
end

return M
