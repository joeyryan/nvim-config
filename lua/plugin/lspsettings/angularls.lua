local mason_registry = require("mason-registry")
local angular_ls_path = mason_registry.get_package("angular-language-server"):get_install_path()

return {
  cmd = {
    "node",
    angular_ls_path .. "/node_modules/@angular/language-server/index.js",
    "--stdio",
    "--tsProbeLocations",
    "/home/entreri/.local/share/npm/lib/node_modules",
    "--ngProbeLocations",
    vim.fn.getcwd() .. "/node_modules",
  },
  filetypes = { "typescript", "html", "typescriptreact", "angular" },
  root_dir = require("lspconfig").util.root_pattern("angular.json", "package.json", "tsconfig.json"),
}
