return {
    {
        'echasnovski/mini-git',
        version = false,
        config = function ()
            require('mini.git').setup()
        end
    },
	{
		"NeogitOrg/neogit",
        event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
        opts = {
            -- disable_line_numbers = false,
            signs = {
                -- { CLOSED, OPENED }
                hunk = { "+", "-" },
                item = { ">", "v" },
                section = { ">", "v" },
            },
        },
		config = function(_, opts)
			local neogit = require("neogit")
			neogit.setup(opts)
			vim.keymap.set("n", "<leader>og", neogit.open, { desc = "Open Neogit" })
		end,
	},
    {
        'echasnovski/mini.diff',
        version = false,
        opts = {
            mappings = {
                apply = '<leader>ga',
                reset = '<leader>gH',
                textobject = 'gh',
                goto_first = '<leader>gf',
                goto_prev = '<leader>gp',
                goto_next = '<leader>gn',
                goto_last = '<leader>gl',
            },
            view = {
                style = "sign",
            },
        },
        config = function (_, opts)
            require("mini.diff").setup(opts)
            vim.keymap.set("n", "<leader>go", require("mini.diff").toggle_overlay, { desc = "Toggle overlay" })
        end
    },
}
