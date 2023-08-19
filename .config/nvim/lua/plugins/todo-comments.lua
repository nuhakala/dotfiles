return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>xt", "<Cmd>:TodoTrouble<CR>", { desc = "Toggle Todo-comments" })
		vim.keymap.set("n", "<leader>tt", "<Cmd>:TodoTelescope<CR>", { desc = "Toggle Todo-comments" })
		require("todo-comments").setup()
	end,
}
