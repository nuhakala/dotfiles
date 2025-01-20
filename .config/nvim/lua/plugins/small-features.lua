return {
	{ "lambdalisue/suda.vim" },
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0,
			}
		}
	},
	{ "jbyuki/quickmath.nvim" },
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>ou", vim.cmd.UndotreeToggle, desc = "Open undotree" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = {
				filetypes = { "norg" },
			},
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require('tiny-inline-diagnostic').setup()
		end
	},
	{
		"nuhakala/nvim-simple-tables",
		event = "VeryLazy",
		config = true,
	},
	-- {
	-- 	"folke/neodev.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = { "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- },
	-- {
	-- 	"jbyuki/nabla.nvim",
	-- 	event = "VeryLazy",
	-- 	keys = {
	-- 		{ "<leader>on", "<cmd>lua require('nabla').popup()<CR>", desc = "Open Nabla popup" },
	-- 	},
	-- },
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
				if utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil" }) then
					return true
				end
				return false
			end,
		},
		config = true,
		keys = {
			{ "<leader>+", ":ASToggle<CR>", desc = "Toggle auto-save" },
		},
	},
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
			{ "<leader>ot", "<CMD>ToggleTerm direction=tab<CR>", desc = "Open terminal" },
			{
				"<leader>ov",
				"<CMD>ToggleTerm size=10 dir=./ direction=horizontal<CR>",
				desc = "Open terminal in horizontal split",
			},
		},
		config = true,
	},
	{
		"otavioschwanck/arrow.nvim",
		event = "VeryLazy",
		config = function()
			require("arrow").setup({
				show_icons = true,
				leader_key = "<leader>h", -- Recommended to be a single key
				index_keys = "aouhtns",
				save_path = function()
					return os.getenv("HOME") .. "/.vim/arrow/"
				end,
			})
		end,
	},
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {},
		config = function()
			require("quicker").setup({
				keys = {
					{
						">",
						function()
							require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
						end,
						desc = "Expand quickfix context",
					},
					{
						"<",
						function()
							require("quicker").collapse()
						end,
						desc = "Collapse quickfix context",
					},
				},
			})
			vim.keymap.set("n", "<leader>q", function()
				require("quicker").toggle()
			end, { desc = "Toggle quickfix" })
			-- vim.keymap.set("n", "<leader>l", function()
				-- 	require("quicker").toggle({ loclist = true })
				-- end, { desc = "Toggle loclist" })
			end,
		},
	}
