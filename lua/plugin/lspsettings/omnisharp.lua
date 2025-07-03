return {
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  enable_editorconfig_support = true,
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,
  enable_ms_build_load_projects_on_demand = false,
  sdk_include_prereleases = true,
  analyze_open_documents_only = false,
  root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
}
