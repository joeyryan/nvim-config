local M = {
  "lervag/vimtex",
  dependencies = {},
  opts = {},
  lazy = false,
}

function M.config()
  -- require("vimtex")
  vim.g.vimtex_view_method = "zathura" -- Set Zathura as the PDF viewer
  vim.g.vimtex_compiler_method = "latexmk" -- Use latexmk for compilation
  vim.g.vimtex_syntax_enabled = 1
  vim.g.vimtex_quickfix_mode = 0 -- Disable quickfix window by default
  vim.g.vimtex_compiler_autostart = 1
  vim.g.vimtex_compiler_latexmk = {
    build_dir = "build", -- Specify build directory if needed
    continuous = 1, -- Enable continuous compilation
    executable = "latexmk",
    options = {
      "-pdf", -- Compile to PDF
      "-interaction=nonstopmode", -- Avoid stopping for errors
      "-synctex=1", -- Enable SyncTeX
    },
  }
end

return M
