return {
	{ "lambdalisue/suda.vim" },
	{
		"saghen/blink.indent",
		--- @module 'blink.indent'
		--- @type blink.indent.Config
		opts = {},
	},
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
	{
		"stevearc/aerial.nvim",
		event = "VeryLazy",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({})
			vim.keymap.set("n", "<leader>oa", "<cmd>AerialToggle!<CR>")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
}
