return {
	{ "lambdalisue/suda.vim" },
	{ "folke/twilight.nvim" },
	{ "vivien/vim-linux-coding-style" },
	{
		"nuhakala/nvim-simple-tables",
        event = "VeryLazy",
		config = true,
	},
	{
		"m4xshen/hardtime.nvim",
        event = "VeryLazy",
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
        event = "VeryLazy",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"jbyuki/nabla.nvim",
        event = "VeryLazy",
		keys = {
			{"<leader>on", "<cmd>lua require('nabla').popup()<CR>", desc = "Open Nabla popup",},
			{"<leader>oN", "<cmd>lua require('nabla').enable_virt({ autogen = true })<CR>", desc = "Enable nabla mode",},
		},
	},
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle", -- optional for lazy loading on command
        -- commit = "610e72307d675fcc15098c5a435ad89e45aaf855",
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
        opts = {
            execution_message = {
                enabled = false,
            },
            -- condition = function(buf)
            --     local fn = vim.fn
            --     local utils = require("auto-save.utils.data")

            --     -- don't save for `norg` file types
            --     if utils.not_in(fn.getbufvar(buf, "&filetype"), {'norg'}) then
            --         return true
            --     end
            --     return false
            -- end
        },
        config = true,
		keys = {
			{ "<leader>+", ":ASToggle<CR>", desc = "Toggle auto-save" },
		},
	},
	{
		"kevinhwang91/nvim-bqf",
        event = "VeryLazy",
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
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
        event = "VeryLazy",
		version = "*",
		opts = {
            autochdir = true,
            direction = "tab",
        },
		keys = {
			{ "<leader>ot", "<CMD>ToggleTerm<CR>", desc = "Open terminal" },
		},
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
    -- {
    --     "ggandor/leap.nvim",
    --     config = function ()
    --         require("leap").create_default_mappings()
    --     end
    -- },
    {
        "otavioschwanck/arrow.nvim",
        event = "VeryLazy",
        config = function ()
            require('arrow').setup({
                show_icons = true,
                leader_key = '<leader>h', -- Recommended to be a single key
                save_path = function()
                    return os.getenv("HOME") .. "/.vim/arrow/"
                end,
            })
        end
    },
    {
        'nanozuki/tabby.nvim',
        event = 'VimEnter',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("tabby.tabline").use_preset("active_wins_at_tail")
        end,
    },
	{
		"folke/todo-comments.nvim",
        event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = {
            merge_keywords = true,
            keywords = {
                BOOKMARK = { icon = "", color = "test" },
            },
        },
		keys = {
			-- { "<leader>xt", "<CMD>:TodoTrouble<CR>", desc = "Toggle Todo-comments" },
			{ "<leader>tt", "<Cmd>:TodoTelescope<CR>", desc = "Todo-comments" },
			-- { "<leader>tm", "<Cmd>:TodoTelescope<CR>bookmark", desc = "Search bookmarks" },
			{ "<leader>qt", "<Cmd>:TodoQuickFix<CR>", desc = "Todo-comments" },
		},
	},
    -- {
    --     "LintaoAmons/bookmarks.nvim",
    --     config = true,
    -- },
    {
        "ThePrimeagen/vim-be-good"
    },
    {
        'crusj/bookmarks.nvim',
        branch = 'main',
        dependencies = { 'nvim-web-devicons' },
        event = "VeryLazy",
        config = function()
            require("bookmarks").setup({
                virt_text = "Bookmark",
                virt_pattern = {"*.*"},
                storage_dir = "/home/nuuttih/.vim/bookmarks",
                keymaps = {
                    toggle = "<leader>tm",
                },
            })
			vim.keymap.set("n", "<leader>tm", require("bookmarks").toggle_bookmarks, { desc = "Search bookmarks" })
        end
    }
}
