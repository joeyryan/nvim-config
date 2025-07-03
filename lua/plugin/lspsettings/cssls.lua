return {
  settings = {
    css = {
      validate = true,
    },
    scss = {
      validate = true,
    },
    less = {
      validate = true,
    },
  },
  filetypes = { "css", "scss", "less" },
  root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
}
