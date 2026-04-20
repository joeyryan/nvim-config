-- Note: schemastore is loaded lazily, so we use a function for schemas
return {
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = { ".git", ".yamllint", ".yamllint.yaml", ".yamllint.yml" },
  settings = {
    yaml = {
      schemas = nil, -- Will be set in on_init
      validate = true,
      hover = true,
      completion = true,
      format = { enable = true },
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
  on_init = function(client)
    local ok, schemastore = pcall(require, "schemastore")
    if ok then
      client.config.settings.yaml.schemas = schemastore.yaml.schemas()
    end
  end,
}
