return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("neogen").setup({ snippet_engine = "luasnip" })
		-- local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "gn", ":lua require('neogen').generate()<CR>", { desc = "Generate annotations", noremap = true, silent = true })
	end,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
