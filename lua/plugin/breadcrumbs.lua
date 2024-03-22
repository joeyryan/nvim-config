-- works with nvim-navic to provide context about your code in the winbar

local M = {
	"LunarVim/breadcrumbs.nvim",
	-- commit = "1033b354f65206793831207d5c9047fc059e35c3",
	dependencies = {
		"SmiteshP/nvim-navic",
		-- commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
	},
}

function M.config()
	local icons = require("core.icons")

	require("nvim-navic").setup({
		icons = icons.kind,
		highlight = true,
		lsp = {
			auto_attach = true,
		},
		click = true,
		separator = " " .. icons.ui.ChevronRight .. " ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	})

	require("breadcrumbs").setup()
end

return M
