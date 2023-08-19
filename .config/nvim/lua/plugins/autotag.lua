return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			enable = true,
			enable_rename = true,
			enable_close = true,
			filetypes = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"vue",
				"tsx",
				"jsx",
				"php",
				"markdown",
			},
		})
	end,
}
