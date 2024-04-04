return {
	{
		"williamboman/mason.nvim",
        event = "VeryLazy",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			-- "jose-elias-alvarez/null-ls.nvim",
			-- "jay-babu/mason-null-ls.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()

			-- Set up capabilities automatically
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local default_setup = function(server)
				lspconfig[server].setup({
					capabilities = lsp_capabilities,
				})
			end

			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = { default_setup },
			})

			-- require("mason-null-ls").setup({
			-- 	ensure_installed = {
			-- 		-- Opt to list sources here, when available in mason.
			-- 	},
			-- 	automatic_installation = false,
			-- 	handlers = {},
			-- })
			-- require("null-ls").setup({
			-- 	sources = {
			-- 		-- Anything not supported by mason.
			-- 	},
			-- })
		end,
	},
}
