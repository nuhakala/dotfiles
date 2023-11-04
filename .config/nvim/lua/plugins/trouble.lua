return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section in github.
	},
	config = function()
		vim.keymap.set("n", "<leader>xx", "<Cmd>TroubleToggle<CR>", { desc = "Toggle Trouble" })
		vim.keymap.set(
			"n",
			"<leader>xw",
			"<Cmd>TroubleToggle workspace_diagnostics<CR>",
			{ desc = "Toggle workspace diagnostics" }
		)
		vim.keymap.set(
			"n",
			"<leader>xd",
			"<Cmd>TroubleToggle document_diagnostics<CR>",
			{ desc = "Toggle document diagnostics" }
		)
		vim.keymap.set("n", "<leader>xq", "<Cmd>TroubleToggle quickfix<CR>", { desc = "Toggle Trouble quickfix" })
		vim.keymap.set("n", "<leader>xl", "<Cmd>TroubleToggle loclist<CR>", { desc = "Toggle Trouble localion list" })

		-- Set keymaps for LSP-features
		vim.keymap.set("n", "gd", function()
			require("trouble").open("lsp_definitions")
		end, { desc = "Definition" })
		vim.keymap.set("n", "go", function()
			require("trouble").open("lsp_type_definitions")
		end, { desc = "Type definitions" })
		vim.keymap.set("n", "gr", function()
			require("trouble").open("lsp_references")
		end, { desc = "References" })
	end,
}
