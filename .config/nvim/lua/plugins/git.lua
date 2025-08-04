return {
	{
		"echasnovski/mini.diff",
		version = false,
		opts = {
			mappings = {
				apply = "<leader>ga",
				reset = "<leader>gH",
				textobject = "gh",
				goto_first = "<leader>gf",
				goto_prev = "<leader>gp",
				goto_next = "<leader>gn",
				goto_last = "<leader>gl",
			},
			view = {
				style = "sign",
			},
		},
		config = function(_, opts)
			require("mini.diff").setup(opts)
			vim.keymap.set("n", "<leader>go", require("mini.diff").toggle_overlay, { desc = "Toggle overlay" })
		end,
	},
	{
		"ejrichards/baredot.nvim", -- to have git for bare git repo
		opts = {
			git_dir = "~/.cfg",
		},
	},
}
