return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		-- "folke/trouble.nvim",
	},
	config = function()
		-- local trouble = require("trouble.providers.telescope")

		local file_ignore_patterns = {
			"node_modules/", -- node modules
			"%.git/", -- git folder
			"%.o", -- c object files
		}
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = file_ignore_patterns,
				path_display = {
					truncate = 1,
				},
				-- layout_strategy = "bottom_pane", --bottom_pane, center, cursor, horizontal, vertical
				-- sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-s>"] = require("telescope.actions").select_default,
						-- Make traversing more intuitive with default layout
						["<C-n>"] = require("telescope.actions").move_selection_previous,
						["<C-p>"] = require("telescope.actions").move_selection_next,
					},
					-- i = { ["<c-t>"] = trouble.open_with_trouble },
					-- n = { ["<c-t>"] = trouble.open_with_trouble },
				},
			},
		})

		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Find files in working dir" })
		vim.keymap.set("n", "<leader>tg", builtin.git_files, { desc = "Find in git files" })
		vim.keymap.set("n", "<leader>tw", builtin.live_grep, { desc = "Live grep working dir" })
		-- vim.keymap.set("n", "<leader>tW", builtin.grep_string, { desc = "Search for word under cursor in working dir" })
		vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Search for buffers" })
		vim.keymap.set("n", "<leader>tW", builtin.current_buffer_fuzzy_find, { desc = "Search in this buffer" })
		vim.keymap.set("n", "<leader>tr", builtin.lsp_references, { desc = "LSP references" })
		vim.keymap.set("n", "<leader>td", builtin.lsp_definitions, { desc = "LSP definitions" })
		vim.keymap.set("n", "<leader>tD", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>ts", builtin.lsp_document_symbols, { desc = "LSP document symbols" })
	end,
}
