return {
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{ "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
			{ "<leader>do", "<CMD>lua require('oil').discard_all_changes()<CR>", desc = "Discard changes" },
		},
	},
}
