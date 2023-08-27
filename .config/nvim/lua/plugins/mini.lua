return {
	{
		"echasnovski/mini.cursorword",
		version = false,
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	{
		"echasnovski/mini.align",
		version = false,
		config = function()
			require("mini.align").setup({
				mappings = {
					start = "<leader>a",
					start_with_preview = "<leader>A",
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "<leader>na", -- Add surrounding in Normal and Visual modes
					delete = "<leader>nd", -- Delete surrounding
					find = "<leader>nf", -- Find surrounding (to the right)
					find_left = "<leader>nF", -- Find surrounding (to the left)
					highlight = "<leader>nh", -- Highlight surrounding
					replace = "<leader>nr", -- Replace surrounding
					update_n_lines = "<leader>nn", -- Update `n_lines`

					suffix_last = "<leader>nl", -- Suffix to search with "prev" method
					suffix_next = "<leader>nt", -- Suffix to search with "next" method
				},
			})
		end,
	},
	{
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			require("mini.sessions").setup()

			-- Setup commands for saving
			local ms = require("mini.sessions")

			-- vim.api.nvim_create_user_command("Sesw", function(opts)
			-- 	ms.write({opts.fargs[1]})
			-- end, { nargs = 1 })
			--
			-- vim.api.nvim_create_user_command("Sesr", function(opts)
			-- 	ms.read({opts.fargs[1]})
			-- end, { nargs = 1 })
			--
			-- vim.api.nvim_create_user_command("Sesd", function(opts)
			-- 	ms.delet({opts.fargs[1]})
			-- end, { nargs = 1 })

			-- Keymaps to save and read the session
			vim.keymap.set("n", "<leader>sw", function()
				local sessionName = vim.fn.input("Write session name to write: ")
				ms.write(sessionName)
			end, { desc = "Save session" })

			vim.keymap.set("n", "<leader>sr", function()
				local sessionName = vim.fn.input("Write session name to read: ")
				ms.read(sessionName)
			end, { desc = "Read session" })

			vim.keymap.set("n", "<leader>sd", function()
				local sessionName = vim.fn.input("Write session name to delete: ")
				ms.delete(sessionName)
			end, { desc = "Delete session" })

			vim.keymap.set("n", "<leader>si", function()
				local action = vim.fn.input("Write action: ")
				ms.select(action)
			end, { desc = "Interactively select action" })
		end,
	},
}
