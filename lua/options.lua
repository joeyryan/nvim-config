vim.cmd.colorscheme "catppuccin-mocha"

vim.opt.breakindent = true                                -- Enable break indent
vim.opt.clipboard = "unnamedplus"                         -- Sync clipboard between OS and Neovim.
vim.opt.completeopt = 'longest,menuone,noselect,noinsert' -- Set completeopt to have a better completion experience
vim.opt.cursorline = true                                 -- highlight current line
vim.opt.hlsearch = false                                  -- Set highlight on search
vim.opt.mouse = 'a'                                       -- Enable mouse mode
vim.opt.number = true                                     -- Make line numbers default
vim.opt.termguicolors = true                              -- true color support
vim.opt.undofile = true                                   -- Save undo history

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"
