return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- or "strict" for more diagnostics
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly", -- or "workspace"
      },
    },
  },
  root_dir = require("lspconfig.util").root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git"),
}
