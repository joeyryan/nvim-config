local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Bind U to redo, since undo is u
keymap("n", "U", "<C-R>")

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

-- Stay in visual mode so you can keep indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Don't copy replaced text into register on paste
keymap("x", "p", [["_dP]])

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

keymap("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
keymap("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- Swap between windows easier
keymap("n", "<C-h>", "<C-w>h", { desc = "Window left" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Window right" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Window down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Window up" })

keymap("n", "<C-\\>", "<C-w>v", { desc = "Split view vertically" })

keymap("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })
