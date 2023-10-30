local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

keymap("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
keymap("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- Swap between windows easier
keymap('n', '<C-h>', "<C-w>h", { desc = 'Window left' })
keymap('n', '<C-l>', "<C-w>l", { desc = 'Window right' })
keymap('n', '<C-j>', "<C-w>j", { desc = 'Window down' })
keymap('n', '<C-k>', "<C-w>k", { desc = 'Window up' })

keymap('n', '<C-\\>', "<C-w>v", { desc = 'Split view vertically' })

keymap("n", "<leader>c", "<cmd>bw<cr>", { desc = "Close buffer" })

-- Bufferline
keymap('n', '<tab>', "<cmd> BufferLineCycleNext <CR>", { desc = 'Go to next bufferline in order' })
keymap('n', '<S-tab>', "<cmd> BufferLineCyclePrev <CR>", { desc = 'Go to previous bufferline in [order' })

keymap('n', '<C-Up>', "<cmd>resize -2<CR>", { desc = 'Resize split up' })
keymap('n', '<C-Down>', "<cmd>resize +2<CR>", { desc = 'Resize split down' })
keymap('n', '<C-Left>', "<cmd>vertical resize -2<CR>", { desc = 'Resize split left' })
keymap('n', '<C-Right>', "<cmd>vertical resize +2<CR>", { desc = 'Resize split right' })




------ needs work:

-- keymap('n', "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })
-- keymap('n', "<leader>fc", function() require("telescope.builtin").grep_string() end, { desc = "Find word under cursor" })
-- keymap('n', "<leader>fC", function() require("telescope.builtin").commands() end, { desc = "Find commands" })
-- keymap('n', "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
-- keymap('n', "<leader>fF",
--   function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
--   { desc = "Find all files" })


-- keymap('n', "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Find help" })
-- keymap('n', "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Find keymaps" })
-- keymap('n', "<leader>fm", function() require("telescope.builtin").man_pages() end, { desc = "Find man" })

-- keymap('n', "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Find history" })
-- keymap('n', "<leader>fr", function() require("telescope.builtin").registers() end, { desc = "Find registers" })
-- keymap('n', "<leader>fw", function() require("telescope.builtin").live_grep() end, { desc = "Find words" })
-- keymap('n', "<leader>fW",
--   function()
--     require("telescope.builtin").live_grep {
--       additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
--     }
--   end, { desc = "Find words in all files" })
