local M = {}

local whichkey = require("which-key")

-- Wrapped function to set keybindings. Currently using which-key to set bindings
-- and provide documentation
function M.add_keymap(keymaps, options)
	local opts
	if options then
		opts = options
	else
		opts = {
			mode = "n", -- NORMAL mode
			prefix = "",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
			expr = false, -- use `expr` when creating keymaps
		}
	end
	whichkey.register(keymaps, opts)
end

return M
