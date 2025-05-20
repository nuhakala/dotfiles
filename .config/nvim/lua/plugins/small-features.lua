return {
	{ "lambdalisue/suda.vim" },
	{ "HiPhish/jinja.vim" },
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>ou", vim.cmd.UndotreeToggle, desc = "Open undotree" },
		},
	},
	{
		"nuhakala/nvim-simple-tables",
		event = "VeryLazy",
		config = true,
	},
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		opts = {
			condition = function(buf)
				local fn = vim.fn
				local utils = require("auto-save.utils.data")

				-- don't save for `oil` file types
				if utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil" }) then
					return true
				end
				return false
			end,
		},
		config = true,
		keys = {
			{ "<leader>+", ":ASToggle<CR>", desc = "Toggle auto-save" },
		},
	},
}
