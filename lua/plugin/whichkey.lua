-- Shows a popup that displays keybinding definitions
local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local mappings = {
    ["q"] = { "<cmd>confirm qa<CR>", "Quit" },
    ["c"] = { ":lua require('bufdelete').bufdelete(0, false)<cr>", "Close" },
    ["w"] = { "<cmd>w<CR>", "Save" },
    ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["e"] = { "<cmd>NvimTreeFocus<CR>", "Explorer" },
    ["o"] = { "<cmd>AerialToggle!<CR>", "Aerial" },
    ["n"] = { "<cmd>enew<cr>", "New File" },
    b = {
      name = "Buffers",
    },

    d = {
      name = "Debug",
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    },

    f = {
      name = "Find",
      b = { "<cmd>Telescope buffers previewer=false<cr>", "Find Buffer" },
      f = { "<cmd>Telescope find_files<cr>", "Find Files" },
      p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
      t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
      s = { "<cmd>Telescope grep_string<cr>", "Find String" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      H = { "<cmd>Telescope highlights<cr>", "Highlights" },
      l = { "<cmd>Telescope resume<cr>", "Last Search" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },

    g = {
      name = "Git",
      g = { "<cmd>Neogit<cr>", "Neogit" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
    },

    a = {
      name = "Action",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      -- f = { "<cmd>lua vim.lsp.buf.format({timeout_ms = 1000000})<cr>", "Format" },
      f = { "<cmd>lua require('conform').format()<cr>", "Format" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },

      -- d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
      -- w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
      -- q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
      -- s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      -- S = {
      -- 	"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      -- 	"Workspace Symbols",
      -- },
      -- e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    },

    l = {
      name = "LSP",
      r = { "<cmd>Telescope lsp_references<cr>", "References" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      w = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
      i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
      d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definitions" },
      -- r = { "<cmd>lua require('trouble').toggle('lsp_references')<cr>", "LSP References" },
      -- i = { "<cmd>lua require('trouble').toggle('lsp_implementations')<cr>", "LSP Implementations" },
      -- d = { "<cmd>lua require('trouble').toggle('lsp_definitions')<cr>", "LSP Definitions" },
      -- t = { "<cmd>lua require('trouble').toggle('lsp_type_definitions')<cr>", "LSP Type Definitions" },
    },

    t = {
      name = "Trouble",
      t = { "<cmd>lua require('trouble').toggle()<cr>", "Toggle" },
      w = { "<cmd>lua require('trouble').toggle('workspace_diagnostics')<cr>", "Workspace Diagnostics" },
      d = { "<cmd>lua require('trouble').toggle('document_diagnostics')<cr>", "Document Diagnostics" },
      q = { "<cmd>lua require('trouble').toggle('quickfix')<cr>", "Quickfix" },
      l = { "<cmd>lua require('trouble').toggle('loclist')<cr>", "Loclist" },
      j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    },

    ["\\"] = {
      name = "Settings",
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      l = { "<cmd>LspInfo<cr>", "Info" },
      m = { "<cmd>Mason<cr>", "Mason Info" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
  -- see https://neovim.io/doc/user/map.html#:map-cmd
  local vmappings = {
    ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
    a = {
      name = "Action",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    },
  }

  local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local which_key = require("which-key")

  which_key.setup({
    plugins = {
      marks = false, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,
        suggestions = 20,
      }, -- use which-key for spelling hints
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  })

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)
  -- local keymap = require("core.utils").add_keymap
  -- keymap(mappings, opts)
  -- keymap(vmappings, vopts)
end

return M
