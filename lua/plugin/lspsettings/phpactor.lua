return {
  cmd = { "phpactor", "language-server" },
  filetypes = { "php" },
  root_dir = require("lspconfig.util").root_pattern("composer.json", ".git", ".phpactor.json"),
  settings = {
    phpactor = {
      language_server_phpstan_enabled = true,
      language_server_completion_trim_leading_dollar = true,
    },
  },
}
