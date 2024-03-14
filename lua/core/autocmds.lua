-- Don't autocomment new lines when opening a new line,
-- by pressing O for example, from a commented line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Allows closing specified buffer types q
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"git",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

---- 2024-03--08 Not sure I need this...
-- vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
-- 	callback = function()
-- 		vim.cmd("quit")
-- 	end,
-- })

-- Auto resize split windows when resizing vim
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

---- Disabled 2024-03-08 - I'm not sure I need this...
-- Notify if a file was changed from outside vim
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.cmd("checktime")
-- 	end,
-- })

-- Briefly highlight text when yanking
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
	end,
})

-- Turn on text wrapping and spell check for Git and Markdown files.
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
