local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
}

function M.config()
  require("catppuccin").setup({
    flavour = "mocha",

    no_italic = false,
    no_bold = false,
    no_underline = false,

    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = { "italic" },
      keywords = { "italic" },

      functions = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},

      -- Turns off Catppuccin's extra hard-coded syntax styles.
      -- Useful when you want only the categories above italicized.
      miscs = {},
    },

    -- Keep diagnostic virtual text from becoming italic just because the
    -- theme defaults do that.
    lsp_styles = {
      virtual_text = {
        errors = {},
        hints = {},
        warnings = {},
        information = {},
        ok = {},
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    color_overrides = {
      all = {
        text = "#d8e0ff",
        -- base = "#1d1d2d",
      },
    },

    custom_highlights = function(colors)
      local hl = {
        NvimTreeFolderArrowOpen = {
          fg = colors.overlay0,
          -- fg = colors.lavender,
        },
        NvimTreeFolderArrowClosed = {
          fg = colors.overlay0,
          -- fg = colors.lavender,
        },
        NvimTreeIndentMarker = {
          fg = colors.surface0,
        },
        TroubleIndentFoldOpen = {
          fg = colors.surface2,
        },
        TroubleIndentFoldClosed = {
          fg = colors.surface2,
        },
      }

      local function green_comment()
        return {
          fg = colors.green,
          style = { "italic" },
        }
      end

      local function set(group)
        hl[group] = green_comment()
      end

      -- Treesitter captures.
      --
      -- Rust parser/filetype: rust
      -- Lua parser/filetype: lua
      -- C# filetype is commonly "cs"; Treesitter parser is commonly "c_sharp".
      -- "csharp" is included as a harmless fallback for custom setups.
      for _, lang in ipairs({ "rust", "lua", "cs", "c_sharp", "csharp" }) do
        -- set("@comment." .. lang)
        set("@comment.documentation." .. lang)

        -- LSP semantic token comments.
        -- set("@lsp.type.comment." .. lang)
        set("@lsp.mod.documentation." .. lang)
        set("@lsp.typemod.comment.documentation." .. lang)
      end

      -- Rust Vim syntax fallback groups.
      -- These matter when regex syntax still contributes, or when Treesitter/LSP
      -- does not cover a particular comment region.
      for _, group in ipairs({
        -- "rustCommentLine",
        -- "rustCommentBlock",
        "rustCommentLineDoc",
        "rustCommentLineDocLeader",
        "rustCommentBlockDoc",
        "rustCommentBlockDocStar",
        "rustCommentDocCodeFence",
      }) do
        set(group)
      end

      -- C# Vim syntax fallback groups.
      for _, group in ipairs({
        "csLineComment",
        "csBlockComment",
        "csComment",
        "csSummary",
        "csXmlComment",
        "csXmlCommentLeader",
        "csXmlCommentTag",
        "csXmlCommentString",
      }) do
        set(group)
      end

      -- Lua Vim syntax fallback groups.
      for _, group in ipairs({
        "luaComment",
        "luaCommentDelimiter",
      }) do
        set(group)
      end

      return hl
    end,

    default_integrations = true,

    -- If you're using lazy.nvim, this lets Catppuccin auto-enable integrations
    -- for installed plugins that it knows about.
    auto_integrations = true,

    integrations = {
      cmp = true,

      gitsigns = {
        enabled = true,
        transparent = false,
      },

      nvimtree = true,
      neotree = true,

      telescope = {
        enabled = true,
      },

      treesitter_context = true,
      rainbow_delimiters = true,

      notify = true,
      noice = true,
      fidget = true,
      mason = true,
      which_key = true,

      indent_blankline = {
        enabled = true,
        scope_color = "",
        colored_indent_levels = false,
      },

      mini = {
        enabled = true,
        indentscope_color = "",
      },

      dap = true,
      dap_ui = true,

      render_markdown = true,
      lsp_trouble = true,
    },
  })

  vim.cmd.colorscheme("catppuccin")
end

return M
