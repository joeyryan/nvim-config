-- Fuzzy finder with previews. Search through files, buffers, commands, and other lists
local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
  lazy = true,
  cmd = "Telescope",
}

function M.config()
  local icons = require("core.icons")
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      prompt_prefix = icons.telescope.Search,
      selection_caret = icons.telescope.Forward,
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    file_ignore_patterns = { ".git/", "node_modules/", "dist/" },
    },
    pickers = {
      live_grep = {
        -- theme = "dropdown",
        prompt_prefix = icons.telescope.FindText,
      },

      grep_string = {
        -- theme = "dropdown",
        prompt_prefix = icons.telescope.FindText,
      },
      find_files = {
        -- theme = "dropdown",
        -- previewer = true,
        prompt_prefix = icons.telescope.FindFile,
        -- hidden = true
      },
      treesitter = {
        prompt_prefix = icons.telescope.Code,
      },
      lsp_type_definitions = {
        prompt_prefix = icons.telescope.Type,
        -- theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_definitions = {
        prompt_prefix = icons.telescope.Code,
        -- theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_references = {
        prompt_prefix = icons.telescope.Reference,
        -- theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_implementations = {
        prompt_prefix = icons.telescope.Implementation,
        -- theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_document_symbols = {
        prompt_prefix = icons.telescope.Symbols,
        -- theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_workspace_symbols = {
        prompt_prefix = icons.telescope.Symbols,
        -- theme = "dropdown",
        initial_mode = "normal",
      },
      buffers = {
        theme = "dropdown",
        layout_config = {
          height = 25,
        },
        previewer = true,
        initial_mode = "normal",
        sort_mru = true, -- sort buffers by most recently used (mru)
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      colorscheme = {
        enable_preview = true,
      },
    },
    -- file_sorter = require("telescope.sorters").get_fuzzy_file,
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  })

  telescope.load_extension("fzf")

  local keymap = vim.api.nvim_set_keymap
  keymap("n", "<leader><leader>", "<cmd> Telescope buffers<CR>", { desc = "Open list of buffers" })
end

return M
