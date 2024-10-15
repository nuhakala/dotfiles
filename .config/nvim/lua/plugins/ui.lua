return {
	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				border = "rounded",
				-- relative = "editor",
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
			vim.notify = require("notify")
		end,
	},
	{
		-- Highlighting to color codes #ff00ff
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				-- filetypes = {
				--     '*', -- Highlight all files, but customize some others.
				--     "!norg",
				-- },
				user_default_options = { names = false },
			})
		end,
	},
	{
		"nanozuki/tabby.nvim",
		event = "VimEnter",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("tabby.tabline").use_preset("active_wins_at_tail")
		end,
	},
}
