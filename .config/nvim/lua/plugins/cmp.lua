return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		-- dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- snippets = { preset = "luasnip" },
			keymap = { preset = "default" },
			appearance = { nerd_font_variant = "mono" },
			completion = {
				documentation = { auto_show = true },
				menu = { draw = { columns = {
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
					{ "source_id" }
				}}},
			},
			cmdline = { completion = { menu = { auto_show = true } } },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}
