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
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			require("mini.sessions").setup({
				autoread = true,
			})

			-- Setup commands for saving
			local ms = require("mini.sessions")

			-- Keymaps to save and read the session
			vim.keymap.set("n", "<leader>.w", function()
				vim.ui.input({ prompt = "Enter session name: " }, function(user_input)
					-- Cancelled input
					if not user_input or user_input == "" then
						return
					end
					ms.write(user_input)
				end)
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
}
