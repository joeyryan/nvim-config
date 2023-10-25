local map = vim.keymap.set


-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recently opened files' })
map('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })

map('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
map('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
map('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
map('n', '<leader>fh', builtin.help_tags, { desc = "Find help tag" })


-- [[ Basic Keymaps ]]

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })



-- Nvim tree
map('n', '<leader>e', "<cmd> NvimTreeToggle <CR>", { desc = 'Toggle nvimtree' })
-- map('n', '<leader>e', "<cmd> NvimTreeFocus <CR>", { desc = 'Focus nvimtree' })

-- Bufferline
map('n', '<tab>', "<cmd> BufferLineCycleNext <CR>", { desc = 'Go to next bufferline in order' })
map('n', '<S-tab>', "<cmd> BufferLineCyclePrev <CR>", { desc = 'Go to previous bufferline in order' })


-- Swap between windows easier
map('n', '<C-h>', "<C-w>h", { desc = 'Window left' })
map('n', '<C-l>', "<C-w>l", { desc = 'Window right' })
map('n', '<C-j>', "<C-w>j", { desc = 'Window down' })
map('n', '<C-k>', "<C-w>k", { desc = 'Window up' })

map('n', '<C-\\>', "<C-w>v", { desc = 'Split view vertically' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })


-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- quit
map("n", "<leader>qq", "<cmd>confirm q<cr>", { desc = "Quit nvim (with confirmation)" })
map("n", "<leader>qb", "<cmd>bw<cr>", { desc = "Close buffer" })
map("n", "<leader>qw", "<cmd>wqa<cr>", { desc = "Save all and quit" })
