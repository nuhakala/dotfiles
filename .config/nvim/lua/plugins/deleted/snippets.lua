return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			-- { "rafamadriz/friendly-snippets" }, -- Snippet library
		},
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		event = "VeryLazy",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/luasnip/" } })
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })

			-- Load friendly-snippets
			-- require("luasnip.loaders.from_vscode").lazy_load()

			local luasnip = require("luasnip")
			-- vim.keymap.set({"i"}, "<C-Space>", function() luasnip.expand() end, {silent = true})
			vim.keymap.set({ "i", "s" }, "<C-n>", function()
				luasnip.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-p>", function()
				luasnip.jump(-1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-c>", function()
				if luasnip.choice_active() then
					luasnip.change_choice(1)
				end
			end, { silent = true })
		end,
	},
}
