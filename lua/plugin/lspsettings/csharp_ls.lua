return {
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
}
