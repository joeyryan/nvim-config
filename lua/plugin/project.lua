local M = {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
}

function M.config()
	require("project_nvim").setup({
		active = true,
		on_config_done = nil,
		manual_mode = false,
		detection_methods = { "pattern" },
		patterns = {
			".git",
			"Makefile",
			-- "package.json",
		},
		ignore_lsp = {},
		exclude_dirs = {},
		show_hidden = false,
		silent_chdir = false,
		scope_chdir = "global",
	})

	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_set_keymap

	keymap("n", "<c-p>", ":lua require('telescope').extensions.projects.projects()<CR>", opts)
end

return M
