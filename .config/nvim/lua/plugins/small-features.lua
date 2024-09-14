return {
	{ "lambdalisue/suda.vim" },
	-- { "folke/twilight.nvim" },
	-- { "vivien/vim-linux-coding-style" },
    { "jbyuki/quickmath.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            exclude = {
                filetypes = { "norg" }
            }
        },
    },
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
			{"<leader>dn", "<cmd>lua require('nabla').disable_virt()<CR>", desc = "Disable nabla mode",},
		},
	},
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
        opts = {
            execution_message = {
                enabled = false,
            },
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                -- don't save for `norg` file types
                if utils.not_in(fn.getbufvar(buf, "&filetype"), {'oil'}) then
                    return true
                end
                return false
            end
        },
        config = true,
		keys = {
			{ "<leader>+", ":ASToggle<CR>", desc = "Toggle auto-save" },
		},
	},
	-- {
	-- 	"JoosepAlviste/nvim-ts-context-commentstring",
	-- 	config = function()
	-- 		require("ts_context_commentstring").setup({})
	-- 	end,
	-- },
	{
		"akinsho/toggleterm.nvim",
        event = "VeryLazy",
		version = "*",
		opts = {
            autochdir = true,
            direction = "tab",
            float_opts = {
                border = "double",
            },
        },
		keys = {
			{ "<leader>ot", "<CMD>ToggleTerm<CR>", desc = "Open terminal" },
		},
        config = function (_, opts)
            require("toggleterm").setup(opts)

            local git = function ()
                vim.cmd("TermExec cmd='jj st || git status'")
                vim.cmd("startinsert!")
            end

            vim.keymap.set("n", "<leader>gg", git, {noremap = true, silent = true, desc = "Open commandline git" })
        end
	},
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
	-- {
	-- 	"folke/todo-comments.nvim",
	--        event = "VeryLazy",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	lazy = false,
	-- 	opts = {
	--            merge_keywords = true,
	--            keywords = {
	--                BOOKMARK = { icon = "", color = "test" },
	--            },
	--            highlight = {
	--                keyword = "fg",
	--            },
	--        },
	-- 	keys = {
	-- 		{ "<leader>xt", "<CMD>:TodoTrouble<CR>", desc = "Toggle Todo-comments" },
	-- 		{ "<leader>tt", "<Cmd>:TodoTelescope<CR>", desc = "Todo-comments" },
	-- 	},
	-- },
    {
        "LintaoAmons/bookmarks.nvim",
        dependencies = {
            {"stevearc/dressing.nvim"}
        },
        opts = {
            json_db_path = "/home/nuuttih/.vim/bookmarks.db.json"
        },
        keys = {
            {"mm", "<cmd>BookmarksMark<cr>",  desc = "Mark current line into active BookmarkList." },
            {"mo", "<cmd>BookmarksGoto<cr>",  desc = "Go to bookmark at current active BookmarkList" },
            {"ma", "<cmd>BookmarksCommands<cr>",  desc = "Find and trigger a bookmark command." },
        },
        config = true,
    },
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{ "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
			{ "<leader>do", "<CMD>lua require('oil').discard_all_changes()<CR>", desc = "Discard changes" },
        },
	},
    {
        'stevearc/quicker.nvim',
        event = "FileType qf",
        ---@module "quicker"
        ---@type quicker.SetupOptions
        opts = {},
        config = function ()
            require("quicker").setup({
                keys = {
                    { ">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end, desc = "Expand quickfix context", },
                    { "<", function() require("quicker").collapse() end, desc = "Collapse quickfix context", },
                },
            })
            vim.keymap.set("n", "<leader>q", function() require("quicker").toggle() end, { desc = "Toggle quickfix", })
            vim.keymap.set("n", "<leader>l", function() require("quicker").toggle({ loclist = true }) end, { desc = "Toggle loclist", })
        end
    },
}
