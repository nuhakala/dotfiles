return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 1000
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = {
				marks = false, -- shows a list of your marks on ' and `
				registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				},
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = false, -- adds help for motions
					text_objects = false, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = false, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = false, -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			operators = {}, -- { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				["<space>"] = "SPACE",
				["<cr>"] = "ENTER",
				["<tab>"] = "TAB",
			},
			motions = {
				count = true,
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			window = {
				border = "none", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
			show_help = true, -- show a help message in the command line for using WhichKey
			show_keys = true, -- show the currently pressed key and its label as a message in the command line
			-- triggers = "auto", -- automatically setup triggers with = "auto"
			triggers = { "<leader>", "<localleader>", "z", "<c-w>", "g" }, -- or specifiy a list manually
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for keymaps that start with a native binding
				i = { "j", "k" },
				v = { "j", "k" },
                -- g = { "~", "?", "j", "J", "k", "p", "P", "q", "u", "U", "w"}
			},
		})

		wk.register({
			["<leader>"] = {
                ["<leader>"] = { name = "More" },
                -- Some bug here, wont show the group name correctly without having one other value also.
                ["g"] = { name = "+Git", s = "Stage hunk", },
                ["o"] = { name = "Open" },
                ["r"] = { name = "Find and replace" },
                ["q"] = { name = "Quickfix" },
				["s"] = { name = "Session management" },
				["e"] = { name = "Tablemode" },
				["t"] = { name = "Telescope" },
                ["u"] = { name = "Select", s = "Start selecting text with Treesitter" },
				["d"] = { name = "+Delete" },
				["y"] = { name = "+Yank" },
				["p"] = { name = "+Paste" },
				["n"] = { name = "+Surround", n = "Update n-lines" },
			},
            ["<localleader>"] = {
                ["n"] = { name = "New", n = "New Note" },
                ["t"] = { name = "Todo", d = "Mark as Done" },
                ["i"] = { name = "Insert", d = "Insert date" },
                ["l"] = { name = "List", i = "Invert (Un)ordered List" },
                ["m"] = { name = "Mode", n = "Neorg mode norg" },
            },
		})
	end,
}
