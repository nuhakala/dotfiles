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
					truncate = 1,
				},
			},
		})

    require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Find files in working dir" })
		vim.keymap.set("n", "<leader>tg", builtin.git_files, { desc = "Find in git files" })
		vim.keymap.set("n", "<leader>tW", builtin.live_grep, { desc = "Live grep working dir" })
		-- vim.keymap.set("n", "<leader>tW", builtin.grep_string, { desc = "Search for word under cursor in working dir" })
		vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Search for buffers" })
		vim.keymap.set("n", "<leader>tw", builtin.current_buffer_fuzzy_find, { desc = "Search in this buffer" })
		vim.keymap.set("n", "<leader>tr", builtin.lsp_references, { desc = "LSP references" })
		vim.keymap.set("n", "<leader>td", builtin.lsp_definitions, { desc = "LSP definitions" })
	end,
}
