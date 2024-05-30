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
    -- nvim-notify is quite cool, but notifier is more minimalisti and less distractive
    --[[
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
		},
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
	},
    --[=[]]
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
    --]=]
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			hint_enable = false,
			-- floating_window_off_y = -1,
			-- floating_window_off_x = 10,
			floating_window_above_cur_line = true,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
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
