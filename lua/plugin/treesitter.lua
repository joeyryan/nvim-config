-- Language parsing tools for code highlighting, folding, indentation, etc.
local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "VeryLazy",
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      opts = {
        enable_autocmd = false,
      },
    },
    {
      "windwp/nvim-ts-autotag",
      event = "VeryLazy",
    },
  },
}

function M.config()
  ---@diagnostic disable-next-line: missing-fields
  require("nvim-treesitter").install({
    "html",
    "lua",
    "markdown",
    "markdown_inline",
    "bash",
    "python",
    "typescript",
    "javascript",
    "c_sharp",
    "sql",
    "json",
    "tsx",
    "terraform",
    "rust",
    "c",
    "cpp",
    "yaml",
    "toml",
    "vim",
    "vimdoc",
  })
  require("nvim-treesitter").setup({
    ignore_install = {},
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "markdown" },
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    autotag = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@class.outer",
          ["it"] = "@class.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@scopename.inner",
          ["aA"] = "@attribute.outer",
          ["iA"] = "@attribute.inner",
          ["aF"] = "@frame.outer",
          ["iF"] = "@frame.inner",
        },
      },
    },
  })
end

return M
