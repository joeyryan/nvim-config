-- Shows a popup that displays keybinding definitions
local M = {
  "folke/which-key.nvim",
  -- commit="53b6085",
  event = "VeryLazy",
}

function M.config()
  local mappings =   {
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment", nowait = true, remap = false },
    { "<leader>\\", group = "Settings", nowait = true, remap = false },
    { "<leader>\\c", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<leader>\\l", "<cmd>LspInfo<cr>", desc = "LSP Info", nowait = true, remap = false },
    { "<leader>\\m", "<cmd>Mason<cr>", desc = "Mason Info", nowait = true, remap = false },
    { "<leader>a", group = "Action", nowait = true, remap = false },
    { "<leader>aa", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    { "<leader>af", "<cmd>lua require('conform').format()<cr>", desc = "Format", nowait = true, remap = false },
    { "<leader>al", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    { "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
    { "<leader>b", group = "Buffers", nowait = true, remap = false },
    { "<leader>c", ":lua require('bufdelete').bufdelete(0, false)<cr>", desc = "Close", nowait = true, remap = false },
    { "<leader>d", group = "Debug", nowait = true, remap = false },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor", nowait = true, remap = false },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI", nowait = true, remap = false },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back", nowait = true, remap = false },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", nowait = true, remap = false },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect", nowait = true, remap = false },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session", nowait = true, remap = false },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into", nowait = true, remap = false },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over", nowait = true, remap = false },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause", nowait = true, remap = false },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit", nowait = true, remap = false },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl", nowait = true, remap = false },
    { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start", nowait = true, remap = false },
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint", nowait = true, remap = false },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out", nowait = true, remap = false },
    { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Explorer", nowait = true, remap = false },
    { "<leader>f", group = "Find", nowait = true, remap = false },
    { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Highlights", nowait = true, remap = false },
    { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>fb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find Buffer", nowait = true, remap = false },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files", nowait = true, remap = false },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help", nowait = true, remap = false },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search", nowait = true, remap = false },
    { "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects", nowait = true, remap = false },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File", nowait = true, remap = false },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text", nowait = true, remap = false },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word", nowait = true, remap = false },
    { "<leader>g", group = "Git", nowait = true, remap = false },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)", nowait = true, remap = false },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff", nowait = true, remap = false },
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit", nowait = true, remap = false },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
    { "<leader>l", group = "LSP", nowait = true, remap = false },
    { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions", nowait = true, remap = false },
    { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations", nowait = true, remap = false },
    { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References", nowait = true, remap = false },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
    { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type Definitions", nowait = true, remap = false },
    { "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
    { "<leader>n", "<cmd>enew<cr>", desc = "New File", nowait = true, remap = false },
    { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Aerial", nowait = true, remap = false },
    { "<leader>q", "<cmd>confirm qa<CR>", desc = "Quit", nowait = true, remap = false },
    { "<leader>t", group = "Trouble", nowait = true, remap = false },
    { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document Diagnostics", nowait = true, remap = false },
    { "<leader>tj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic", nowait = true, remap = false },
    { "<leader>tk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
    { "<leader>tl", "<cmd>Trouble loclist toggle<cr>", desc = "Loclist", nowait = true, remap = false },
    { "<leader>tq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix", nowait = true, remap = false },
    { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle", nowait = true, remap = false },
    { "<leader>tw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostics", nowait = true, remap = false },
    { "<leader>w", "<cmd>w<CR>", desc = "Save", nowait = true, remap = false },
  }


  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }
  local vmappings =   {
    {
      mode = { "v" },
      { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)", nowait = true, remap = false },
      { "<leader>a", group = "Action", nowait = true, remap = false },
      { "<leader>aa", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
      { "<leader>c", ":lua require('bufdelete').bufdelete(0, false)<cr>", desc = "Close", nowait = true, remap = false },
      { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Explorer", nowait = true, remap = false },
      { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
      { "<leader>n", "<cmd>enew<cr>", desc = "New File", nowait = true, remap = false },
      { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Aerial", nowait = true, remap = false },
      { "<leader>q", "<cmd>confirm qa<CR>", desc = "Quit", nowait = true, remap = false },
      { "<leader>w", "<cmd>w<CR>", desc = "Save", nowait = true, remap = false },
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
    delay = 300,
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
      win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = true,
        -- width = 1,
        -- height = { min = 4, max = 25 },
        -- col = 0,
        -- row = math.huge,
        -- border = "none",
        -- padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
        title = true,
        title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
          -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
      },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line

    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  })

  which_key.add(mappings, opts)
  which_key.add(vmappings, vopts)
end

return M
