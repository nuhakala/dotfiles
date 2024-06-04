return {
	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				border = "rounded",
				-- relative = "editor",
			},
		},
	},
    {
        "vigoux/notifier.nvim",
        config = function()
            require'notifier'.setup {
                components = {  -- Order of the components to draw from top to bottom (first nvim notifications, then lsp)
                    "nvim",  -- Nvim notifications (vim.notify and such)
                    "lsp"  -- LSP status updates
                },
            }
        end
    },
	{
		"levouh/tint.nvim",
		opts = {
			tint = -90,
		},
	},
	{
		-- Highlighting to color codes #ff00ff
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
                -- filetypes = {
                --     '*', -- Highlight all files, but customize some others.
                --     "!norg",
                -- },
                user_default_options = { names = false }
			})
		end,
	},
    {
        'nanozuki/tabby.nvim',
        event = 'VimEnter',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("tabby.tabline").use_preset("active_wins_at_tail")
        end,
    },
}
