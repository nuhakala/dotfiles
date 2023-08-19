return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		-- "nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")
		vim.keymap.set("n", "<leader>go", neogit.open, { desc = "Open Neogit" })
		require("neogit").setup()
	end,
}
