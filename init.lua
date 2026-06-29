LAZY_PLUGIN_SPEC = {}

local function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

require("core.options")
require("core.keymaps")
require("core.autocmds")

if vim.g.vscode then
  -- VSCode-specific config (if any)
else
  -- UI
  spec("plugin.colorscheme")
  spec("plugin.devicons")
  spec("plugin.lualine")
  spec("plugin.alpha")
  spec("plugin.indentline")

  -- Navigation
  spec("plugin.nvimtree")
  spec("plugin.telescope")
  spec("plugin.harpoon")
  spec("plugin.project")
  spec("plugin.aerial")

  -- Editor features
  spec("plugin.treesitter")
  spec("plugin.comment")
  spec("plugin.illuminate")
  spec("plugin.todo-comments")
  spec("plugin.zen")

  -- LSP & Completion
  spec("plugin.mason")
  spec("plugin.lsp")
  spec("plugin.typescript-tools")
  spec("plugin.blink")
  spec("plugin.clangd_extensions")
  spec("plugin.breadcrumbs")
  spec("plugin.fidget")
  spec("plugin.trouble")
  spec("plugin.dap")

  -- Formatting
  spec("plugin.conform")

  -- Git
  spec("plugin.gitsigns")
  spec("plugin.neogit")
  spec("plugin.diffview")

  -- Utilities
  spec("plugin.toggleterm")
  spec("plugin.bufdelete")
  spec("plugin.netrw")
  spec("plugin.whichkey")

  -- Language-specific
  spec("plugin.vimtex")
  spec("plugin.markview")
  spec("plugin.copilot")

  require("plugin.lazy")
end
