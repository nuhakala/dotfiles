return {
	"neovim-treesitter/nvim-treesitter",
	dependencies = { "neovim-treesitter/treesitter-parser-registry" },
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({ "markdown", "python", "go", "bash", "lua" })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "markdown", "python", "go", "shell", "sh", "lua", "yaml", "tex", "html" },
			callback = function()
				vim.treesitter.start() -- highlighting
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
			end,
		})
	end,
}
