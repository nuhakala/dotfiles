return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			-- disable_background = true,
	-- 			-- disable_float_background = true,
	-- 		})
	-- 		-- vim.cmd('colorscheme rose-pine-moon')
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	opts = {
	-- 		transparent = true,
	-- 		overrides = function(colors)
	-- 			local theme = colors.theme
	-- 			return {
	-- 				-- Dark completion popup menu
	-- 				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
	-- 				PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
	-- 				PmenuSbar = { bg = theme.ui.bg_m1 },
	-- 				PmenuThumb = { bg = theme.ui.bg_p2 },

	-- 				-- Transparent floating windows
	-- 				NormalFloat = { bg = "none" },
	-- 				FloatBorder = { bg = "none" },
	-- 				FloatTitle = { bg = "none" },
	-- 				NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
	-- 				LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	-- 				MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	-- 			}
	-- 		end,
	-- 		-- Remove background of linenumbers etc.
	-- 		colors = {
	-- 			theme = {
	-- 				all = {
	-- 					ui = {
	-- 						bg_gutter = "none",
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	-- config = function()
	-- 	--  vim.cmd([[colorscheme kanagawa-dragon]])
	-- 	-- end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function(opts)
			require("catppuccin").setup({
				transparent_background = true,
				float = {
					transparent = true,
				},
			})
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}
