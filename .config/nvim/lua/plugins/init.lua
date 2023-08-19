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
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = function()
	-- 		vim.opt.list = true
	-- 		-- vim.opt.listchars:append("space:⋅")
	-- 		-- vim.opt.listchars:append("eol:↴")
	-- 		--
	-- 		require("indent_blankline").setup({
	-- 			space_char_blankline = " ",
	-- 			show_current_context = true,
	-- 			indent_blankline_char = "┆",
	-- 		})
	--
	-- 		vim.g.indent_blankline_char = "¦"
	-- 		vim.g.indent_blankline_char_blankline = ""
	-- 	end,
	-- },
}
