return {
	{
		"echasnovski/mini.align",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.align").setup({
				mappings = {
					start = "<leader>aa",
					start_with_preview = "<leader>ap",
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "<leader>sa", -- Add surrounding in Normal and Visual modes
					delete = "<leader>sd", -- Delete surrounding
					-- find = "<leader>nf", -- Find surrounding (to the right)
					-- find_left = "<leader>nF", -- Find surrounding (to the left)
					-- highlight = "<leader>nh", -- Highlight surrounding
					replace = "<leader>sr", -- Replace surrounding
					-- update_n_lines = "<leader>nn", -- Update `n_lines`

					-- suffix_last = "<leader>nl", -- Suffix to search with "prev" method
					-- suffix_next = "<leader>nt", -- Suffix to search with "next" method
				},
			})
		end,
	},
	{
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			require("mini.sessions").setup({
				autoread = true,
				hooks = {
					post = {
						read = function()
							-- mini.sessions does not execute post-session autocommand
							-- for whatever reason, so we have to load arrow cache file here
							-- to make it work.
							require("arrow.git").refresh_git_branch()
							require("arrow.persist").load_cache_file()
						end,
						write = nil,
						delete = nil,
					},
				},
			})

			-- Setup commands for saving
			local ms = require("mini.sessions")

			-- Keymaps to save and read the session
			vim.keymap.set("n", "<leader>.w", function()
				ms.select("write")
			end, { desc = "Save session" })
			vim.keymap.set("n", "<leader>.r", function()
				ms.select("read")
			end, { desc = "Load session" })
			vim.keymap.set("n", "<leader>.d", function()
				ms.select("delete")
			end, { desc = "Delete session" })

		end,
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		event = "VeryLazy",
		config = true,
	},
	{
		"echasnovski/mini.trailspace",
		version = false,
		keys = {
			{ "<leader>dt", "<cmd>lua require('mini.trailspace').trim()<CR>", desc = "Trim trailspace" },
		},
	},
}
