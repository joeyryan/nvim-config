local M = {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {},
}

function M.config()
  require("harpoon").setup({
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
  })
  require("telescope").load_extension("harpoon")

  -- Require Harpoon modules
  local harpoon_mark = require("harpoon.mark")
  local harpoon_ui = require("harpoon.ui")
  local harpoon_term = require("harpoon.term")

  -- Keymaps
  vim.keymap.set("n", "<leader>.", harpoon_mark.add_file, { desc = "Add file to Harpoon" }) -- Add file
  vim.keymap.set("n", "<leader>,", harpoon_ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" }) -- Open Harpoon menu

  -- Navigate to files
  vim.keymap.set("n", "<leader>1", function()
    harpoon_ui.nav_file(1)
  end, { desc = "Go to file 1 in Harpoon" })
  vim.keymap.set("n", "<leader>2", function()
    harpoon_ui.nav_file(2)
  end, { desc = "Go to file 2 in Harpoon" })
  vim.keymap.set("n", "<leader>3", function()
    harpoon_ui.nav_file(3)
  end, { desc = "Go to file 3 in Harpoon" })
  vim.keymap.set("n", "<leader>4", function()
    harpoon_ui.nav_file(4)
  end, { desc = "Go to file 4 in Harpoon" })

  -- -- Use Harpoon terminal
  -- vim.keymap.set("n", "<leader>t", function()
  --   harpoon_term.gotoTerminal(1)
  -- end, { desc = "Go to terminal 1" })
  -- vim.keymap.set("n", "<leader>T", function()
  --   harpoon_term.gotoTerminal(2)
  -- end, { desc = "Go to terminal 2" })
end

return M
