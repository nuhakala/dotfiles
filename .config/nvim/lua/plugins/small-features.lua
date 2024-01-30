return {
	{ "lambdalisue/suda.vim" },
	{ "folke/twilight.nvim" },
	{ "vivien/vim-linux-coding-style" },
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
		"jbyuki/nabla.nvim",
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
		version = "*",
		opts = {
            autochdir = true,
            direction = "float",
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
    {
        "ggandor/leap.nvim",
        config = function ()
            require("leap").create_default_mappings()
        end
    },
    {
        "otavioschwanck/arrow.nvim",
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
}
