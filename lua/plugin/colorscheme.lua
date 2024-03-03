local M = {
	"catppuccin/nvim",
	lazy = false, -- make sure we load this during startup
	priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	require("catppuccin").setup({
		lazy = false,
		flavor = "mocha",
		transparent_background = false,
		-- term_colors = false,
		compile = {
			enabled = false,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = { "italic" },
			functions = {},
			keywords = { "italic" },
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		integrations = {
			cmp = true,
			nvimtree = true,
			dashboard = true,
			telescope = {
				enabled = true,
			},
			treesitter = true,
			gitsigns = true,
			fidget = true,
			bufferline = true,

			-- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
		},
		color_overrides = {
			all = {
				text = "#d6e0ff",
				base = "#1d1d2d",
				TabLine = { fg = "#d6e0ff", bg = "#cccccc" },
			},
		},
		highlight_overrides = {},
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
