LAZY_PLUGIN_SPEC = {}

local function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

require("core.options")
require("core.keymaps")
require("core.autocmds")

if vim.g.vscode then
--
else
  spec("plugin.colorscheme")
  spec("plugin.devicons")
  spec("plugin.bufferline")
  spec("plugin.treesitter")
  -- spec("plugin.schemastore")
  spec("plugin.mason")
  spec("plugin.lsp")
  spec("plugin.typescript-tools")
  spec("plugin.breadcrumbs")
  -- spec("plugin.null-ls")
  spec("plugin.illuminate")
  spec("plugin.telescope")
  spec("plugin.nvimtree")
  spec("plugin.trouble")
  spec("plugin.aerial")
  spec("plugin.lualine")
  spec("plugin.cmp")
  spec("plugin.comment")
  spec("plugin.gitsigns")
  spec("plugin.neogit")
  spec("plugin.diffview")
  spec("plugin.indentline")
  spec("plugin.alpha")
  spec("plugin.netrw")
  spec("plugin.project")
  spec("plugin.toggleterm")
  spec("plugin.bufdelete")
  spec("plugin.conform")
  -- spec "plugin.dapui"
  spec("plugin.whichkey")
  require("plugin.lazy")
end
