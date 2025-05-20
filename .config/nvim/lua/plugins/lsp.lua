return {
	{
		"williamboman/mason.nvim",
		version = "v1.8.0",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", version = "v1.29.0" },
			{ "neovim/nvim-lspconfig", version = "v1.8.0" },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup({})
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)
			-- disable LSP snippets
			capabilities.textDocument.completion.completionItem.snippetSupport = false

			-- ***** Setup servers *****
			local lspconfig = require("lspconfig")
			-- gopls configuration
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						buildFlags = {"-tags=e2e"}
					}
				}
			})

			-- enable configurations
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover", buffer = event.buf })
					vim.keymap.set( "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Declaration", buffer = event.buf })
					vim.keymap.set( "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Implementation", buffer = event.buf })
					vim.keymap.set( "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature help", buffer = event.buf })
					vim.keymap.set( "i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature help", buffer = event.buf })
					vim.keymap.set( "n", "<leader>rl", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename", buffer = event.buf })
					vim.keymap.set( { "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { desc = "Format", buffer = event.buf })
					vim.keymap.set( "n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action", buffer = event.buf })
					-- These are set in trouble
					vim.keymap.set( "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Definitions", buffer = event.buf })
					vim.keymap.set( "n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Type Definition", buffer = event.buf })
					vim.keymap.set( "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "References", buffer = event.buf })

					vim.keymap.set( "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Open diagnostics float", buffer = event.buf })
					vim.keymap.set( "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Diagnostics goto previous", buffer = event.buf })
					vim.keymap.set( "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Diagnostics goto next", buffer = event.buf })

					-- Add keymap to open hover, to remember to use it easier.
					-- It is also mapped to "K"
					-- vim.keymap.set("n", "gK", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Open hover, double 'K' -> window" })
				end,
			})
		end,
	},
}
