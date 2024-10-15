return {
	{
		"danymat/neogen",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
			-- local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap(
				"n",
				"gn",
				":lua require('neogen').generate()<CR>",
				{ desc = "Generate annotations", noremap = true, silent = true }
			)
		end,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
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
