-- Code autocompletion plugins and snippets
return {
  -- LuaSnip snippet engine
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
      require("luasnip").filetype_extend("typescriptreact", { "html" })

      require("luasnip").setup({
        region_check_events = "CursorHold,InsertLeave",
        delete_check_events = "TextChanged,InsertEnter",
      })
    end,
  },

  -- Autopairs
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

  -- Completion sources
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-buffer",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-path",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-cmdline",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-emoji",
    event = "InsertEnter",
  },

  {
    "saadparwaiz1/cmp_luasnip",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-nvim-lua",
    event = "InsertEnter",
  },

  -- Main completion plugin
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end

      local icons = require("core.icons")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif cmp.visible() then
              cmp.select_next_item()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            elseif cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = icons.kind[vim_item.kind]
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              supermaven = "[AI]",
              lazydev = "[LazyDev]",
            })[entry.source.name] or entry.source.name

            if entry.source.name == "lab.quick_data" then
              vim_item.kind = icons.misc.CircuitBoard
              vim_item.kind_hl_group = "CmpItemKindConstant"
            end

            return vim_item
          end,
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.order,
            cmp.config.compare.length,
          },
        },
        sources = {
          {
            name = "nvim_lsp",
            entry_filter = function(entry, ctx)
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
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "buffer" },
          { name = "path" },
          { name = "calc" },
          { name = "treesitter" },
          { name = "tmux" },
          {
            name = "lazydev",
            group_index = 0,
          },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          completion = {
            border = "single",
            winhighlight = "Normal:FloatBorder,CursorLine:FloatBorder,FloatBorder:FloatBorder,Search:None",
            col_offset = -3,
            side_padding = 1,
            scrollbar = false,
            scrolloff = 8,
          },
          documentation = {
            border = "single",
            winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
          },
        },
        experimental = {
          ghost_text = false,
        },
      })

      -- Setup autopairs integration
      pcall(function()
        local function on_confirm_done(...)
          require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
        end
        require("cmp").event:off("confirm_done", on_confirm_done)
        require("cmp").event:on("confirm_done", on_confirm_done)
      end)
    end,
  },
}
