LAZY_PLUGIN_SPEC = {}

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

require "core.options"
require "core.keymaps"
require "core.autocmds"

if vim.g.vscode then
  --
else
  spec "plugin.colorscheme"
  spec "plugin.bufferline"
  spec "plugin.devicons"
  spec "plugin.treesitter"
  spec "plugin.mason"
  spec "plugin.schemastore"
  spec "plugin.lspconfig"
  spec "plugin.navic"
  spec "plugin.breadcrumbs"
  spec "plugin.null-ls"
  spec "plugin.illuminate"
  spec "plugin.telescope"
  spec "plugin.telescope-tabs"
  spec "plugin.nvimtree"
  spec "plugin.lualine"
  spec "plugin.whichkey"
  spec "plugin.cmp"
  spec "plugin.autopairs"
  spec "plugin.comment"
  spec "plugin.gitsigns"
  spec "plugin.neogit"
  spec "plugin.diffview"
  spec "plugin.indentline"
  spec "plugin.alpha"
  spec "plugin.netrw"
  spec "plugin.project"
  spec "plugin.toggleterm"
  spec "plugin.bufdelete"
  require "plugin.lazy"
end
