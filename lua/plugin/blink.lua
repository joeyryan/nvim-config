return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("typescriptreact", { "html" })

      require("luasnip").setup({
        region_check_events = "CursorHold,InsertLeave",
        delete_check_events = "TextChanged,InsertEnter",
      })
    end,
  },

  -- Autopairs (blink has its own auto_brackets, autopairs handles character-pair insertion)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        map_char = {
          all = "(",
          tex = "{",
        },
        enable_check_bracket_line = false,
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        disable_in_macro = false,
        enable_afterquote = true,
        map_bs = true,
        map_c_w = false,
        disable_in_visualblock = false,
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0,
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "Search",
          highlight_grey = "Comment",
        },
      })
    end,
  },

  -- Main completion engine
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },

    opts = {
      -- Use LuaSnip for snippet expand/jump
      snippets = {
        preset = "luasnip",
      },

      -- Keymaps: 'enter' preset as base (CR to accept, Tab/S-Tab for snippets)
      -- Override C-k/C-j for menu navigation
      keymap = {
        preset = "enter",
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-j>"] = { "select_next", "fallback_to_mappings" },
        -- Explicit snippet jump bindings (mirrors original C-l/C-h in cmp)
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono",
        -- Use the same kind icons as the rest of the config
        kind_icons = require("core.icons").kind,
      },

      sources = {
        -- Default sources for all filetypes
        default = { "lsp", "path", "snippets", "buffer" },
        -- Lazydev only needed in Lua files
        per_filetype = {
          lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
        },
        providers = {
          lsp = {
            -- Filter out noisy kinds to keep the list focused on code
            -- Mirrors the entry_filter from the old nvim-cmp config:
            --   * Block Text completions (kind=1) everywhere except markdown
            --   * Block Snippet completions (kind=15) in Java (LSP sends them but LuaSnip handles them)
            transform_items = function(ctx, items)
              local ft = vim.bo[ctx.bufnr].filetype
              -- CompletionItemKind numbers (per LSP spec)
              local TEXT = 1
              local SNIPPET = 15
              return vim.tbl_filter(function(item)
                if item.kind == SNIPPET and ft == "java" then
                  return false
                end
                if ft == "markdown" then
                  return true
                end
                if item.kind == TEXT then
                  return false
                end
                return true
              end, items)
            end,
          },
          path = {
            score_offset = 3,
            opts = {
              trailing_slash = true,
              label_trailing_slash = true,
            },
          },
          buffer = {
            score_offset = -3,
          },
          snippets = {
            score_offset = -1,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- Ensure lazydev results always appear at the top in Lua files
            score_offset = 100,
          },
        },
      },

      completion = {
        -- Documentation popup: show automatically when navigating items
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "single",
          },
        },

        -- Completion list: pre-highlight first item but don't auto-insert it —
        -- must press CR to confirm
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },

        menu = {
          border = "single",
          -- Show kind icon | label + detail columns
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
          },
        },

        -- blink handles auto-brackets natively; no cmp on_confirm_done hook needed
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },

        ghost_text = {
          enabled = false,
        },
      },

      -- Built-in signature help (replaces lsp_signature.nvim)
      signature = {
        enabled = true,
        window = {
          border = "single",
          max_width = 100,
        },
      },

      fuzzy = {
        -- Use the Rust binary we build from source; fall back to Lua if not ready
        implementation = "prefer_rust",
      },
    },
  },
}
