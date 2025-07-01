return {
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
      validate = true,
      hover = true,
      completion = true,
      format = {
        enable = true,
      },
      schemaStore = {
        enable = false,
        url = "",
      },
      customTags = {
        "!Ref",
        "!Sub",
        "!GetAtt",
        "!ImportValue",
        "!Join",
        "!If",
        "!Equals",
        "!FindInMap",
        "!Select",
        "!Split",
        "!Not",
        "!And",
        "!Or",
      },
    },
  },
  filetypes = { "yaml", "yml" },
  root_dir = require("lspconfig.util").root_pattern(".git", ".yamllint"),
}
