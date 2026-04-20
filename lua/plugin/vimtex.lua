-- VimTeX for LaTeX editing
local M = {
  "lervag/vimtex",
  ft = { "tex", "latex", "bib" },
}

function M.init()
  -- VimTeX uses vim.g settings, not setup()
  vim.g.vimtex_view_method = "zathura"
  vim.g.vimtex_compiler_method = "latexmk"
  vim.g.vimtex_syntax_enabled = 1
  vim.g.vimtex_quickfix_mode = 0
  vim.g.vimtex_compiler_autostart = 1
  vim.g.vimtex_compiler_latexmk = {
    build_dir = "build",
    continuous = 1,
    executable = "latexmk",
    options = {
      "-pdf",
      "-interaction=nonstopmode",
      "-synctex=1",
    },
  }
end

return M
