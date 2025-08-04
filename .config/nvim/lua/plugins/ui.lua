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
				timeout = 3000,
				render = "wrapped-compact",
			})
			vim.notify = require("notify")
		end,
	},
}
