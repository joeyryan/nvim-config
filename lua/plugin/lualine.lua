-- Add status bar to bottom of neovim window
local M = {
	"nvim-lualine/lualine.nvim",
}

function M.config()
	local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
	vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = sl_hl.background })
	local icons = require("core.icons")
	local diff = {
		"diff",
		colored = true,
		symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
	}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "catppuccin",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = { "NvimTree" },
		},
		sections = {
			-- lualine_a = { {"branch", icon =""} },
			-- lualine_b = { diff },
			-- lualine_c = { "diagnostics" },
			-- lualine_x = { copilot },
			-- lualine_y = { "filetype" },
			-- lualine_z = { "progress" },
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { diff },
			lualine_x = { "diagnostics" },
			lualine_y = { "filetype" },
			lualine_z = { "progress" },
		},
		extensions = {
			"quickfix",
			"man",
			"trouble",
			"toggleterm",
		},
	})
end

return M
