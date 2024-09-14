return {
	{
		"danymat/neogen",
        event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
			-- local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap( "n", "gn", ":lua require('neogen').generate()<CR>", { desc = "Generate annotations", noremap = true, silent = true }
			)
		end,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{
		"stevearc/aerial.nvim",
        event = "VeryLazy",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				on_attach = function(bufnr)
                    -- vim.api.nvim_buf_set_name(0, "Aerial")
					-- Jump forwards/backwards with '{' and '}'
					-- vim.keymap.set("n", "{[", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					-- vim.keymap.set("n", "}]", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
			-- You probably also want to set a keymap to toggle aerial
			vim.keymap.set("n", "<leader>oa", "<cmd>AerialToggle!<CR>")
		end,
	},
    -- {
    --     "dgagn/diagflow.nvim",
    --     -- event = 'LspAttach', This is what I use personnally and it works great
    --     opts = {
    --         scope = "line",
    --         show_borders = true,
    --     }
    -- },
    {
        -- show lightbuld when code action available
        "kosayoda/nvim-lightbulb",
        config = function ()
            require("nvim-lightbulb").setup({
                autocmd = { enabled = true }
            })
        end
    },
    {
        "folke/trouble.nvim",
        -- branch = "dev", -- IMPORTANT!
        keys = {
            { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)", },
            { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
            { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)", },
            { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
            { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)", },
            { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)", },
            { "<leader>xe", "<cmd>Trouble errorDiags toggle<cr>", desc = "Diagnostic errors (Trouble)"}
        },
        opts = {
            auto_close = true,
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
}
