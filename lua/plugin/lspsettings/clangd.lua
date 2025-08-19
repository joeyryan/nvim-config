return {
  -- cmd = { "clangd" }, -- optional, if it's not in PATH or you want a specific binary
  cmd = { "clangd", "--compile-commands-dir=build", "--background-index", "--all-scopes-completion", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  init_options = {
    clangdFileStatus = true,
  },
}
