return {
	{
		"danymat/neogen",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
			-- local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap(
				"n",
				"gn",
				":lua require('neogen').generate()<CR>",
				{ desc = "Generate annotations", noremap = true, silent = true }
			)
		end,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				-- on_attach = function(bufnr)
                    -- vim.api.nvim_buf_set_name(0, "Aerial")
					-- Jump forwards/backwards with '{' and '}'
					-- vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					-- vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				-- end,
			})
			-- You probably also want to set a keymap to toggle aerial
			vim.keymap.set("n", "<leader>oa", "<cmd>AerialToggle!<CR>")
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "black" },
					-- Use a sub-list to run only the first available formatter
                    javascript = { { "prettierd", "prettier" } },
					c = { "clang_format" },
					cpp = { "clang_format" },
                    ["*"] = { "codespell" },
				},
			})

            vim.keymap.set({ "n", "v", "x" }, "<leader>z", function()
                require("conform").format({ lsp_fallback = true })
                print("File formatted")
            end, { desc = "Format" })
		end,
	},
	{
		"cshuaimin/ssr.nvim",
		keys = {
			{ "<leader>rn", function() require("ssr").open() end, { "n", "x" }, desc = "Structural replace" },
		},
	},
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/luasnip/" } })
        end,
    },
}
