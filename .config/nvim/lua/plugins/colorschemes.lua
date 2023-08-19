return {
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		-- config = function()
		-- 	vim.cmd([[colorscheme rose-pine]])
		-- end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd([[colorscheme kanagawa-dragon]])
		end,
	},
}
