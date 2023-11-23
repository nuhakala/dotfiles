return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	-- lazy = true,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		-- {
		-- 	"pysan3/neorg-templates",
		-- 	dependencies = { "L3MON4D3/LuaSnip" },
		-- },
		-- { "pritchett/neorg-capture" },
	},
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {
					config = {
						disable = {
							-- "core.itero",
							"core.journal",
						},
					},
				}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							bpm = "~/filen-drive/muistiinpanot/projects/bpm/",
							str = "~/filen-drive/muistiinpanot/projects/str/",
							conc = "~/filen-drive/muistiinpanot/projects/conc/",
							linux = "~/filen-drive/muistiinpanot/projects/linux/",
							hpc = "~/filen-drive/muistiinpanot/projects/hpc/",
						},
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.keybinds"] = {
					config = {
						default_keybinds = true,
						hook = function(keybinds)
							-- <M-CR> launches terminal in WM
							keybinds.remap_key("norg", "i", "<M-CR>", "<S-CR>")
						end,
					},
				},
				["core.summary"] = {},

				-- ["external.templates"] = {},
				-- ["external.capture"] = {},
			},
		})
	end,
}
