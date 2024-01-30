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
		opts = {
			background_colour = "#000000",
		},
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
	},
	{
		"yorickpeterse/nvim-pqf",
		config = function()
			require("pqf").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = true,
		keys = {
			-- { "<leader>xt", "<CMD>:TodoTrouble<CR>", desc = "Toggle Todo-comments" },
			{ "<leader>tt", "<Cmd>:TodoTelescope<CR>", desc = "Toggle Todo-comments" },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"sahlte/timed-highlight.nvim",
		config = function()
			require("timed-highlight").setup({
				highlight_timeout_ms = 5000,
			})
		end,
	},
    {
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			hint_enable = false,
			-- floating_window_off_y = -1,
			-- floating_window_off_x = 10,
			floating_window_above_cur_line = true,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}
