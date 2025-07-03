return {
  filetypes = { "terraform", "tf" },
  root_dir = require("lspconfig.util").root_pattern(".terraform", ".git", "*.tf"),
  settings = {
    terraform = {
      validateOnSave = true,
    },
  },
}
