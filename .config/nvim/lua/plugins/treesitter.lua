return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- comment.nvim is not required as deps here, but lets add it
		-- here to ensure ts-context-commentstring works fine.
		-- "JoosepAlviste/nvim-ts-context-commentstring",
		-- "numToStr/Comment.nvim",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"javascript",
				"typescript",
				"rust",
				"python",
				"scala",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"css",
				"graphql",
				"html",
				"nix",
				"python",
				"scss",
				"tsx",
				"vue",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},

			context_commentstring = {
				-- These are required for ts-context-commentstring
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
