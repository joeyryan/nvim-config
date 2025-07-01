-- Automatically highlights other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
local M = {
    "crusj/bookmarks.nvim",
    keys = {
        { "<tab><tab>", mode = { "n" } },
    },
    branch = "main",
    dependencies = { "nvim-web-devicons" },
}

function M.config()
  require("bookmarks").setup()
  require("telescope").load_extension("bookmarks")
end

return M
