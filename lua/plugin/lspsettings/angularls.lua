-- local mason_registry = require("mason-registry")
-- local angular_ls_path = mason_registry.get_package("angular-language-server"):get_install_path()
--
-- return {
--   cmd = {
--     "node",
--     angular_ls_path .. "/node_modules/@angular/language-server/index.js",
--     "--stdio",
--     "--tsProbeLocations",
--     "/home/entreri/.local/share/npm/lib/node_modules",
--     "--ngProbeLocations",
--     vim.fn.getcwd() .. "/node_modules",
--   },
--   filetypes = { "typescript", "html", "typescriptreact", "angular", "htmlangular" },
--   root_dir = require("lspconfig").util.root_pattern("angular.json", "package.json", "tsconfig.json"),
-- }

local lspconfig = require("lspconfig")
local mason_registry = require("mason-registry")
local angular_ls_path = mason_registry.get_package("angular-language-server"):get_install_path()

return {
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    "", -- Placeholder, set dynamically
    "--ngProbeLocations",
    "", -- Placeholder, set dynamically
  },
  filetypes = { "html", "css", "scss", "typescript", "typescriptreact" }, -- Removed "angular" (not standard)
  root_dir = lspconfig.util.root_pattern("angular.json", "nx.json", "package.json", "tsconfig.json", ".git"),
  on_new_config = function(new_config, new_root_dir)
    local project_node_modules = new_root_dir and (new_root_dir .. "/node_modules") or ""
    local global_node_modules = "/home/entreri/.local/share/npm/lib/node_modules"
    -- Log for debugging
    vim.notify("AngularLS: Root dir = " .. (new_root_dir or "none"), vim.log.levels.INFO)
    vim.notify("AngularLS: ngProbeLocations = " .. project_node_modules, vim.log.levels.INFO)
    new_config.cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      project_node_modules .. "," .. global_node_modules,
      "--ngProbeLocations",
      project_node_modules .. "," .. global_node_modules,
    }
  end,
  init_options = {
    plugin = {
      core = { logLevel = 3 }, -- Enable verbose logging for debugging
    },
  },
}
