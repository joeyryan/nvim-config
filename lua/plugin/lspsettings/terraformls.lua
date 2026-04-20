return {
  filetypes = { "terraform", "tf", "terraform-vars" },
  root_markers = { ".terraform", "*.tf", ".git" },
  settings = {
    terraform = {
      validateOnSave = true,
    },
  },
}
