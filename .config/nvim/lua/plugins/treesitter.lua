return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- here to ensure ts-context-commentstring works fine.
		-- "JoosepAlviste/nvim-ts-context-commentstring",
        "nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
            -- LSP requires these two for some reason.
            modules = {},
            ignore_install = {},

			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
			},
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				enable = true,
			},

			-- context_commentstring = {
				-- These are required for ts-context-commentstring
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
            --
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>us", -- set to `false` to disable one of the mappings
                    node_incremental = "<leader>ui",
                    scope_incremental = "<leader>uc",
                    node_decremental = "<leader>ud",
                },
            },

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    -- These are binded to a motion -> no need for leader
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'v',
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    include_surrounding_whitespace = true,
                },
            },
		})
	end,
}
