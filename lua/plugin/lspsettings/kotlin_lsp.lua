return {
  cmd = { "kotlin-lsp", "--stdio" },
  filetypes = { "kotlin" },
  -- root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  root_markers = { "settings.gradle", "settings.gradle.kts", "pom.xml", "build.gradle", "build.gradle.kts", "workspace.json" },
}
