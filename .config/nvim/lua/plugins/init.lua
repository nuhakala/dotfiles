return {
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"vivien/vim-linux-coding-style",
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},
	{
		"dhruvasagar/vim-table-mode",
		config = function ()
			-- vim.g.table_mode_map_prefig = "<localleader>m"
			vim.cmd("let g:table_mode_map_prefix = '<localleader>m'")
		end,
	},
	{
		"jbyuki/nabla.nvim",
		config = function ()
			-- require("nabla").setup()
			vim.keymap.set("n", "<leader>o", "<cmd>lua require('nabla').popup()<CR>", { desc = "Open Nabla popup"})
		end,
	}
}
