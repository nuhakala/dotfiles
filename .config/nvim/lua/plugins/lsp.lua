return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason").setup({})

			-- ***** Setup blink capabilities *****
			local override_capabilities = {
				textDocument = {
					completion = {
						completionItem = {
							snippetSupport = false,
						},
					},
				},
			}
			local blink_capabilities = require("blink.cmp").get_lsp_capabilities(override_capabilities)

			-- ***** Setup servers *****
			-- Apply these defaults to all configurations
			vim.lsp.config("*", {
				capabilities = blink_capabilities,
			})

			-- gopls configuration
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						buildFlags = { "-tags=e2e" },
					},
				},
			})

			-- rust for wasm
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						check = {
							overrideCommand = {
								"cargo",
								"component",
								"check",
								"--workspace",
								"--all-targets",
								"--message-format=json",
							},
						},
					},
				},
			})

			-- enable configurations
			vim.lsp.enable("gopls")
			vim.lsp.enable("bashls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("clangd")
			vim.lsp.enable("texlab")
			vim.lsp.enable("rust_analyzer")

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					-- Neorg interim.ls stuff
					local bufnr = event.buf
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if not client then
						return
					end

					if client.server_capabilities.completionProvider then
						vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
					end
					-- Neorg interim.ls stuff

					local set = vim.keymap.set
					set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = event.buf })
					set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = event.buf })
					set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation", buffer = event.buf })
					set("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = event.buf })
					set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = event.buf })
					set("n", "<leader>rl", vim.lsp.buf.rename, { desc = "Rename", buffer = event.buf })
					set({ "n", "x" }, "<F3>", function()
						vim.lsp.buf.format({ async = true })
					end, { desc = "Format", buffer = event.buf })
					set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code action", buffer = event.buf })
					-- These are set in trouble
					set("n", "gd", vim.lsp.buf.definition, { desc = "Definitions", buffer = event.buf })
					set("n", "go", vim.lsp.buf.type_definition, { desc = "Type Definition", buffer = event.buf })
					set("n", "gr", vim.lsp.buf.references, { desc = "References", buffer = event.buf })

					set("n", "gl", vim.diagnostic.open_float, { desc = "Open diagnostics float", buffer = event.buf })
					set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostics goto previous", buffer = event.buf })
					set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostics goto next", buffer = event.buf })
				end,
			})
		end,
	},
}
