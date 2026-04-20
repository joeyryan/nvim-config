-- Harpoon v2 for quick file navigation
local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    settings = {
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { "harpoon" },
      mark_branch = false,
    },
  },
}

M.keys = {
  {
    "<leader>.",
    function()
      require("harpoon"):list():add()
    end,
    desc = "Add file to Harpoon",
  },
  {
    "<leader>,",
    function()
      local harpoon = require("harpoon")
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    desc = "Toggle Harpoon menu",
  },
  {
    "<leader>1",
    function()
      require("harpoon"):list():select(1)
    end,
    desc = "Harpoon file 1",
  },
  {
    "<leader>2",
    function()
      require("harpoon"):list():select(2)
    end,
    desc = "Harpoon file 2",
  },
  {
    "<leader>3",
    function()
      require("harpoon"):list():select(3)
    end,
    desc = "Harpoon file 3",
  },
  {
    "<leader>4",
    function()
      require("harpoon"):list():select(4)
    end,
    desc = "Harpoon file 4",
  },
}

function M.config(_, opts)
  require("harpoon"):setup(opts)
  pcall(require("telescope").load_extension, "harpoon")
end

return M
