return {
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				-- disable_background = true,
				-- disable_float_background = true,
			})
			-- vim.cmd('colorscheme rose-pine-moon')
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			transparent = true,
			overrides = function(colors)
				local theme = colors.theme
				return {
					-- Dark completion popup menu
					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },

					-- Transparent floating windows
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					FloatTitle = { bg = "none" },
					NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
					LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				}
			end,
			-- Remove background of linenumbers etc.
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		},
		-- config = function()
		--  vim.cmd([[colorscheme kanagawa-dragon]])
		-- end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			transparent_mode = true,
		},
		-- config = function (opts)
		--  -- vim.cmd([[colorscheme gruvbox]])
		--  -- vim.cmd([[hi clear Todo]])
		-- end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function(opts)
			require("catppuccin").setup({
				transparent_background = true,
			})
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("lackluster")
		end,
		opts = {
			tweak_background = {
				normal = "default", -- main background
				telescope = "default", -- telescope
				menu = "none", -- nvim_cmp, wildmenu ... (bad idea to transparent)
				popup = "none", -- lazy, mason, whichkey ... (bad idea to transparent)
			},
		},
	},
	{
		"aktersnurra/no-clown-fiesta.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("no-clown-fiesta")
		end,
	},
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("flow").setup({
				transparent = true,
				fluo_color = "green",
				mode = "desaturate",
				aggressive_spell = false,
			})
			-- vim.cmd.colorscheme("flow")
		end,
	},
	{
		"diegoulloao/neofusion.nvim",
		priority = 1000,
		config = true,
		opts = {
			transparent_mode = true,
		},
	},
}
