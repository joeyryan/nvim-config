local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable right mouse click. I only want left click and scrolling. Git gud with keyboard.
keymap("n", "<RightMouse>", "<LeftMouse>")
keymap("i", "<RightMouse>", "<LeftMouse>")
keymap("v", "<RightMouse>", "<LeftMouse>")
keymap("x", "<RightMouse>", "<LeftMouse>")

-- Right click menu
-- keymap("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
-- vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
-- vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd([[:amenu 10.120 mousemenu.-sep- *]])

-- Set leader key to Space
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bring up the keybinding list (WhichKey)
keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)

-- 2024-03-08 - I don't know what this is for... disabling for now
-- keymap("n", "<C-i>", "<C-i>", opts)

-- Bind U to redo, since undo is u
keymap("n", "U", "<C-R>")

-- better copy and paste...
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>y", '"+y')
keymap("n", "<leader>p", '"+p')

-- Stop overwriting my primary register. Use 'z' register instead
keymap("n", "d", '"_d', opts)
keymap("v", "d", '"_d', opts)
keymap("n", "x", '"_x', opts)
keymap("v", "x", '"_x', opts)
keymap("n", "c", '"_c', opts)
keymap("v", "c", '"_c', opts)

-- Move between window panes with CTRL+H/J/K/L
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- Keep cursor centered (zz) when searching
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in visual mode so you can keep indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Don't copy replaced text into register on paste
keymap("x", "p", [["_dP]])

-- Swap between windows easier
keymap("n", "<C-h>", "<C-w>h", { desc = "Window left" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Window right" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Window down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Resize window panes with CTRL + Arrow Keys
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Split into a new window pane
keymap("n", "<C-\\>", "<C-w>v", { desc = "Split view vertically" })
