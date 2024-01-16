return {
	{ "lambdalisue/suda.vim" },
	{ "folke/twilight.nvim" },
	{ "vivien/vim-linux-coding-style" },
	{
		"sahlte/timed-highlight.nvim",
		config = function()
			require("timed-highlight").setup({
				highlight_timeout_ms = 5000,
			})
		end,
	},
	---[[
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{ "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
		},
	},
	--[=[]]
	{
	    'simonmclean/triptych.nvim',
	    event = 'VeryLazy',
	    dependencies = {
	        'nvim-lua/plenary.nvim', -- required
	        'nvim-tree/nvim-web-devicons', -- optional
	    },
	    config = function ()
	        require 'triptych'.setup({
                options = {
                    line_numbers = {
                        relative = true,
                    }
                }
            })
	        vim.keymap.set('n', '-', ':Triptych<CR>', { silent = true })
	    end
	},
    --]=]
	-- {
	--         "folke/neoconf.nvim",
	-- },
	{
		"nuhakala/nvim-simple-tables",
		config = true,
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {
			disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
			notification = true,
			max_count = 10,
			disable_mouse = false,
		},
	},
	{
		"folke/neodev.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"jbyuki/nabla.nvim",
		keys = {
			{"<leader>on", "<cmd>lua require('nabla').popup()<CR>", desc = "Open Nabla popup",},
			{"<leader>oN", "<cmd>lua require('nabla').enable_virt({ autogen = true })<CR>", desc = "Enable nabla mode",},
		},
	},
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
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = true,
		keys = {
			-- { "<leader>xt", "<CMD>:TodoTrouble<CR>", desc = "Toggle Todo-comments" },
			{ "<leader>tt", "<Cmd>:TodoTelescope<CR>", desc = "Toggle Todo-comments" },
		},
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
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
			-- You probably also want to set a keymap to toggle aerial
			vim.keymap.set("n", "<leader>oa", "<cmd>AerialToggle!<CR>")
		end,
	},
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle", -- optional for lazy loading on command
        -- commit = "610e72307d675fcc15098c5a435ad89e45aaf855",
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
        config = true,
		keys = {
			{ "<leader>+", ":ASToggle<CR>", desc = "Toggle auto-save" },
		},
	},
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
		"kevinhwang91/nvim-bqf",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			-- fzf integration for neat fzf search
			{
				"junegunn/fzf",
				build = function()
					vim.fn["fzf#install"]() -- installs always newest version
				end,
			},
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
		config = function()
			local neogit = require("neogit")
			vim.keymap.set("n", "<leader>og", neogit.open, { desc = "Open Neogit" })
			neogit.setup({})
		end,
	},
	{
		"luukvbaal/nnn.nvim",
		config = function()
			require("nnn").setup({
				picker = {
					session = "local",
				},
			})
			vim.keymap.set("n", "<leader>oh", "<CMD>NnnPicker<CR>", { desc = "Open NNN" })
			vim.keymap.set("n", "<leader>oe", "<CMD>NnnExplorer<CR>", { desc = "Open NNN" })
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({})
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
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>z", function()
				require("conform").format()
				print("File formatted")
			end, { desc = "Format" })
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
		keys = {
			{ "<leader>ot", "<CMD>ToggleTerm<CR>", desc = "Open terminal" },
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000"
			})
			vim.notify = require("notify")
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
		keys = {
			{ "<leader>ri", "<CMD>IncRename<CR>", desc = "Inclusive rename" },
		},
	},
	{
		"cshuaimin/ssr.nvim",
		keys = {
			{ "<leader>rn", function() require("ssr").open() end, { "n", "x" }, desc = "Structural replace" },
		},
	},
    {
        "ggandor/leap.nvim",
        config = function ()
            require("leap").create_default_mappings()
        end
    },
}
