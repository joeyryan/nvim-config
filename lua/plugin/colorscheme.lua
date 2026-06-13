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

      local function spec(fg, style)
        return {
          fg = fg,
          style = style or {},
        }
      end

      local function set(group, fg, style)
        hl[group] = spec(fg, style)
      end

      local function set_comment(group)
        set(group, colors.green, { "italic" })
      end

      -- Comments / documentation comments: green italic.
      for _, lang in ipairs({ "rust", "lua", "cs", "c_sharp", "csharp" }) do
        set_comment("@comment.documentation." .. lang)

        set_comment("@lsp.mod.documentation." .. lang)
        set_comment("@lsp.typemod.comment.documentation." .. lang)
      end

      -- Rust Vim syntax fallback groups for comments.
      for _, group in ipairs({
        "rustCommentLineDoc",
        "rustCommentLineDocLeader",
        "rustCommentBlockDoc",
        "rustCommentBlockDocStar",
        "rustCommentDocCodeFence",
      }) do
        set_comment(group)
      end

      -- C# Vim syntax fallback groups for comments.
      for _, group in ipairs({
        -- "csLineComment",
        -- "csBlockComment",
        -- "csComment",
        "csSummary",
        "csXmlComment",
        "csXmlCommentLeader",
        "csXmlCommentTag",
        "csXmlCommentString",
      }) do
        set_comment(group)
      end

      ---------------------------------------------------------------------------
      -- Rust custom colors
      ---------------------------------------------------------------------------

      -- Rust macros
      for _, group in ipairs({
        "rustMacro",
        "@lsp.type.macro.rust",
        "@lsp.typemod.macro.defaultLibrary.rust",
        "@lsp.typemod.macro.library.rust",
      }) do
        set(group, colors.sapphire)
      end

      -- Sigils include &, *, and other symbols
      set("rustSigil", colors.sapphire)

      -- rustStorage includes "mut" keyword
      set("rustStorage", colors.mauve)

      set("@lsp.type.selfTypeKeyword.rust", colors.mauve)
      set("@lsp.type.selfKeyword.rust", colors.red)
      set("@lsp.type.builtinType.rust", colors.mauve)
      set("@lsp.type.struct.rust", colors.yellow)
      set("@lsp.type.namespace.rust", colors.peach)
      set("rustModPathSep", colors.sapphire)
      set("@lsp.type.formatSpecifier.rust", colors.pink)
      set("@lsp.type.escapeSequence.rust", colors.pink)
      set("@lsp.typemod.function.defaultLibrary.rust", colors.blue)

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
