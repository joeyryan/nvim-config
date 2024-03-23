-- Provides indentation guides and highlights current scope
local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	-- commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
}

function M.config()
	local icons = require("core.icons")

	require("ibl").setup({
		indent = {
			char = icons.ui.LineMiddle,
		},
		exclude = {
			buftypes = { "terminal", "nofile" },
			filetypes = {
				"help",
				"startify",
				"dashboard",
				"lazy",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"text",
			},
		},
		scope = {
			enabled = true,
			-- show_start = false,
			show_end = false,
			injected_languages = false,
			highlight = { "Function", "Label" },
		},
	})
end

return M
