return {
	"okuuva/auto-save.nvim",
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	keys = {
		{ "<leader>+", ":ASToggle<CR>", desc = "Toggle auto-save" },
	},
	opts = {
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")

			-- don't save for `sql` file types
			if utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil" }) then
				return true
			end
			return false
		end,
		-- your config goes here
		-- or just leave it empty :)
	},
}
