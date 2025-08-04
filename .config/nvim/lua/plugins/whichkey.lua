return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		triggers = {
			{ "<leader>", mode = { "n", "v" } },
			{ "z", mode = { "n", "v" } },
			{ "g", mode = { "n", "v" } },
		},
		delay = 1000,
		icons = {
			mappings = false,
		},
		spec = {
			{ "<leader>.", group = "Session" },
			{ "<leader>d", group = "Delete" },
			{ "<leader>e", group = "Tablemode" },
			{ "<leader>g", group = "Git" },
			{ "<leader>o", group = "Open" },
			{ "<leader>p", group = "Paste" },
			{ "<leader>r", group = "Find and replace" },
			{ "<leader>s", group = "Surround and spell management" },
			{ "<leader>t", group = "Telescope" },
			{ "<leader>y", group = "Yank" },
			{ "<leader>a", group = "Align" },
			{ "<localleader>f", group = "Find" },
			{ "<localleader>i", group = "Insert" },
			{ "<localleader>l", group = "List" },
			{ "<localleader>m", group = "Mode" },
			{ "<localleader>n", group = "New" },
			{ "<localleader>t", group = "Todo" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
