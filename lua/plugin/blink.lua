local M = {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = false, -- Or "*" for main branch; set vim.g.lazyvim_blink_main = true if using main
  build = "cargo build --release", -- Requires Rust
  dependencies = {
    "rafamadriz/friendly-snippets", -- For snippets
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      opts = {
        region_check_events = "CursorHold,InsertLeave",
        delete_check_events = "TextChanged,InsertEnter",
      },
    },
    { "windwp/nvim-autopairs", event = "InsertEnter" }, -- Keep if needed
    -- Optional compat for nvim-cmp sources
    { "saghen/blink.compat", opts = {} },
  },
}
function M.config()
  local icons = require("core.icons")
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip").filetype_extend("typescriptreact", { "html" })

  require("blink.cmp").setup({
    build = "release", -- Or "debug" for testing
    appearance = {
      kind_icons = icons.kind, -- Use your icons
    },
    sources = {
      default = { "lsp", "local", "snippets" }, -- LSP first for prioritization
      providers = {
        lsp = {
          name = "LSP",
          score_offset = 100, -- Boost LSP
          entry_filter = function(entry, ctx) -- Reuse your filter
            local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
            if kind == "Snippet" and ctx.prev_context.filetype == "java" then
              return false
            end
            if ctx.prev_context.filetype == "markdown" then
              return true
            end
            if kind == "Text" then
              return false
            end
            return true
          end,
        },
        ["local"] = { name = "Local" }, -- Buffer/path equivalent
        snippets = {
          name = "Snippets",
          expand = function(snippet)
            require("luasnip").lsp_expand(snippet)
          end,
        },
        -- Add more via compat if needed, e.g., path, calc
      },
    },
    keymap = {
      preset = "default", -- Or custom like your Tab mappings
    },
    -- Sorting is handled internally with fuzzy score; tweak via score_offset for sources
  })

  -- Keep autopairs setup as-is
  require("nvim-autopairs").setup({ -- Your existing config here
    -- ...
  })
end
return M
