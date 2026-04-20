-- Note: schemastore is loaded lazily, so we use on_init
return {
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  settings = {
    json = {
      schemas = nil, -- Will be set in on_init
      validate = { enable = true },
    },
  },
  on_init = function(client)
    local ok, schemastore = pcall(require, "schemastore")
    if ok then
      client.config.settings.json.schemas = schemastore.json.schemas()
    end
  end,
}
