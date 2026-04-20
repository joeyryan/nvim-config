return {
  cmd = { "phpactor", "language-server" },
  filetypes = { "php" },
  root_markers = { "composer.json", ".phpactor.json", ".phpactor.yml", ".git" },
  settings = {
    phpactor = {
      language_server_phpstan_enabled = true,
      language_server_completion_trim_leading_dollar = true,
    },
  },
}
