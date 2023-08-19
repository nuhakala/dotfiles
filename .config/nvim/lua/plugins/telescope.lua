return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = {
					truncate = 2,
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>tg", builtin.git_files, { desc = "Find in git files" })
		vim.keymap.set("n", "<leader>tw", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>tW", builtin.grep_string, { desc = "Search for word under cursor" })
    require("telescope").load_extension("fzf")
	end,
}
