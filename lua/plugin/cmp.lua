-- Code autocompletion plugins and snippets
-- nvim-cmp allows multiple code completion sources such as the current buffer, snippets, etc
local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
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
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
      event = "InsertEnter",
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
    },
  },
}

function M.config()
  -- vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

  local cmp = require("cmp")
  local luasnip = require("luasnip")
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip").filetype_extend("typescriptreact", { "html" })

  -- Add this LuaSnip setup for better region handling (forgets placeholders on InsertLeave/TextChanged)
  luasnip.setup({
    region_check_events = "CursorHold,InsertLeave",
    delete_check_events = "TextChanged,InsertEnter",
  })

  local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
  end

  local icons = require("core.icons")

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
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
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items (prevents mid-snippet accidents).
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_locally_jumpable() then -- Check snippet first to prioritize jumps/expansions (ignores visible popup)
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
        if luasnip.locally_jumpable(-1) then -- Check snippet first for backward jumps
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- Dedicated keys for snippet jumps (work even with popup open; kept as backup)
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
        -- Display source name in the menu field
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
          supermaven = "[AI]", -- If you add Supermaven
          lazydev = "[LazyDev]",
        })[entry.source.name] or entry.source.name -- Fallback to raw source name if not mapped

        if entry.source.name == "lab.quick_data" then
          vim_item.kind = icons.misc.CircuitBoard
          vim_item.kind_hl_group = "CmpItemKindConstant"
        end

        -- if entry.source.name == "emoji" then
        --   vim_item.kind = icons.misc.Smiley
        --   vim_item.kind_hl_group = "CmpItemKindEmoji"
        -- end
        return vim_item
      end,
    },
    sorting = {
      priority_weight = 2, -- Boosts higher-priority sources slightly more
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score, -- Fuzzy matching relevance
        -- Custom comparator to deprioritize underscore-prefixed items (e.g., private vars)
        -- function(entry1, entry2)
        --   local _, entry1_under = entry1.completion_item.label:find("^_+")
        --   local _, entry2_under = entry2.completion_item.label:find("^_+")
        --   entry1_under = entry1_under or 0
        --   entry2_under = entry2_under or 0
        --   if entry1_under > entry2_under then
        --     return false
        --   elseif entry1_under < entry2_under then
        --     return true
        --   end
        -- end,
        cmp.config.compare.recently_used, -- Prioritize recently used items
        cmp.config.compare.locality, -- Prioritize local scope
        cmp.config.compare.kind, -- Prioritize by type (e.g., methods over vars)
        cmp.config.compare.sort_text,
        cmp.config.compare.order,
        cmp.config.compare.length, -- Length now lower priority
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
      -- { name = "emoji" },
      { name = "treesitter" },
      { name = "tmux" },
      {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = {
        border = "single",
        -- winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
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

  pcall(function()
    local function on_confirm_done(...)
      require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
    end
    require("cmp").event:off("confirm_done", on_confirm_done)
    require("cmp").event:on("confirm_done", on_confirm_done)
  end)

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
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },
  })
end

return M
