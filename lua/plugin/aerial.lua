local M = {
  -- Aerial is a symbol outline navigation tool
  "stevearc/aerial.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
}

function M.config()
  vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")
  require("aerial").setup({
    -- on_attach = function(bufnr)
    --   -- Jump forwards/backwards with '{' and '}'
    --   vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    --   vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    -- end,
    -- Priority list of preferred backends for aerial.
    -- This can be a filetype map (see :help aerial-filetype-map)
    backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
    layout = {
      -- These control the width of the aerial window.
      -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_width and max_width can be a list of mixed types.
      -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
      max_width = { 30, 0.2 },
      width = nil,
      min_width = 16,
      -- key-value pairs of window-local options for aerial window (e.g. winhl)
      win_opts = {},
      -- Determines the default direction to open the aerial window. The 'prefer'
      -- options will open the window in the other direction *if* there is a
      -- different buffer in the way of the preferred direction
      -- Enum: prefer_right, prefer_left, right, left, float
      default_direction = "prefer_right",
      -- Determines where the aerial window will be opened
      --   edge   - open aerial at the far right/left of the editor
      --   window - open aerial to the right/left of the current window
      placement = "window",
      -- When the symbols change, resize the aerial window (within min/max constraints) to fit
      resize_to_content = true,
      -- Preserve window size equality with (:help CTRL-W_=)
      preserve_equality = false,
    },
    -- Determines how the aerial window decides which buffer to display symbols for
    --   window - aerial window will display symbols for the buffer in the window from which it was opened
    --   global - aerial window will display symbols for the current window
    attach_mode = "window",
    -- List of enum values that configure when to auto-close the aerial window
    --   unfocus       - close aerial when you leave the original source window
    --   switch_buffer - close aerial when you change buffers in the source window
    --   unsupported   - close aerial when attaching to a buffer that has no symbol source
    close_automatic_events = {},
    -- Set to `false` to remove a keymap
    keymaps = {
      ["?"] = "actions.show_help",
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.jump",
      ["<2-LeftMouse>"] = "actions.jump",
      ["<C-v>"] = "actions.jump_vsplit",
      ["<C-s>"] = "actions.jump_split",
      ["p"] = "actions.scroll",
      ["<C-j>"] = "actions.down_and_scroll",
      ["<C-k>"] = "actions.up_and_scroll",
      ["{"] = "actions.prev",
      ["}"] = "actions.next",
      ["[["] = "actions.prev_up",
      ["]]"] = "actions.next_up",
      ["q"] = "actions.close",
      ["o"] = "actions.tree_toggle",
      ["za"] = "actions.tree_toggle",
      ["O"] = "actions.tree_toggle_recursive",
      ["zA"] = "actions.tree_toggle_recursive",
      ["l"] = "actions.tree_open",
      ["zo"] = "actions.tree_open",
      ["L"] = "actions.tree_open_recursive",
      ["zO"] = "actions.tree_open_recursive",
      ["h"] = "actions.tree_close",
      ["zc"] = "actions.tree_close",
      ["H"] = "actions.tree_close_recursive",
      ["zC"] = "actions.tree_close_recursive",
      ["zr"] = "actions.tree_increase_fold_level",
      ["zR"] = "actions.tree_open_all",
      ["zm"] = "actions.tree_decrease_fold_level",
      ["zM"] = "actions.tree_close_all",
      ["zx"] = "actions.tree_sync_folds",
      ["zX"] = "actions.tree_sync_folds",
    },
    -- Don't load aerial until a command or function is called
    -- Defaults to true, unless `on_attach` is provided, then it defaults to false
    lazy_load = false,
    -- Disable aerial on files with this many lines
    disable_max_lines = 10000,
    -- Disable aerial on files this size or larger (in bytes)
    disable_max_size = 2000000, -- Default 2MB
    -- A list of all symbols to display. Set to false to display all symbols.
    -- This can be a filetype map (see :help aerial-filetype-map)
    -- To see all available values, see :help SymbolKind

    -- filter_kind = {
    --   "Class",
    --   "Constructor",
    --   "Enum",
    --   "Function",
    --   "Interface",
    --   "Module",
    --   "Method",
    --   "Struct",
    -- },

    filter_kind = false,
    -- Determines line highlighting mode when multiple splits are visible.
    -- split_width   Each open window will have its cursor location marked in the
    --               aerial buffer. Each line will only be partially highlighted
    --               to indicate which window is at that location.
    -- full_width    Each open window will have its cursor location marked as a
    --               full-width highlight in the aerial buffer.
    -- last          Only the most-recently focused window will have its location
    --               marked in the aerial buffer.
    -- none          Do not show the cursor locations in the aerial window.
    highlight_mode = "split_width",
    -- Highlight the closest symbol if the cursor is not exactly on one.
    highlight_closest = true,
    -- Highlight the symbol in the source buffer when cursor is in the aerial win
    highlight_on_hover = true,
    -- When jumping to a symbol, highlight the line for this many ms.
    -- Set to false to disable
    highlight_on_jump = 300,
    -- Jump to symbol in source window when the cursor moves
    autojump = false,
    -- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
    -- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
    -- default collapsed icon. The default icon set is determined by the
    -- "nerd_font" option below.
    -- If you have lspkind-nvim installed, it will be the default icon set.
    -- This can be a filetype map (see :help aerial-filetype-map)
    icons = {},
    -- Control which windows and buffers aerial should ignore.
    -- Aerial will not open when these are focused, and existing aerial windows will not be updated
    ignore = {
      -- Ignore unlisted buffers. See :help buflisted
      unlisted_buffers = false,
      -- Ignore diff windows (setting to false will allow aerial in diff windows)
      diff_windows = true,
      -- List of filetypes to ignore.
      filetypes = {},
      -- Ignored buftypes.
      -- Can be one of the following:
      -- false or nil - No buftypes are ignored.
      -- "special"    - All buffers other than normal, help and man page buffers are ignored.
      -- table        - A list of buftypes to ignore. See :help buftype for the
      --                possible values.
      -- function     - A function that returns true if the buffer should be
      --                ignored or false if it should not be ignored.
      --                Takes two arguments, `bufnr` and `buftype`.
      buftypes = "special",
      -- Ignored wintypes.
      -- Can be one of the following:
      -- false or nil - No wintypes are ignored.
      -- "special"    - All windows other than normal windows are ignored.
      -- table        - A list of wintypes to ignore. See :help win_gettype() for the
      --                possible values.
      -- function     - A function that returns true if the window should be
      --                ignored or false if it should not be ignored.
      --                Takes two arguments, `winid` and `wintype`.
      wintypes = "special",
    },
    -- Use symbol tree for folding. Set to true or false to enable/disable
    -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
    -- This can be a filetype map (see :help aerial-filetype-map)
    manage_folds = false,
    -- When you fold code with za, zo, or zc, update the aerial tree as well.
    -- Only works when manage_folds = true
    link_folds_to_tree = false,
    -- Fold code when you open/collapse symbols in the tree.
    -- Only works when manage_folds = true
    link_tree_to_folds = true,
    -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
    -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
    nerd_font = "auto",
    -- Automatically open aerial when entering supported buffers.
    -- This can be a function (see :help aerial-open-automatic)
    open_automatic = false,
    -- When true, aerial will automatically close after jumping to a symbol
    close_on_select = false,
    -- The autocmds that trigger symbols update (not used for LSP backend)
    update_events = "TextChanged,InsertLeave",
    -- Show box drawing characters for the tree hierarchy
    show_guides = true,

    -- Customize the characters used when show_guides = true
    guides = {
      -- When the child item has a sibling below it
      mid_item = "├─",
      -- When the child item is the last in the list
      last_item = "└─",
      -- When there are nested child guides to the right
      nested_top = "│ ",
      -- Raw indentation
      whitespace = "  ",
    },
  })
end

return M
