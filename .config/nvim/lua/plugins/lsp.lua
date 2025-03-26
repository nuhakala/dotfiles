return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            -- "hrsh7th/cmp-nvim-lsp",
            "folke/neoconf.nvim",
			"saghen/blink.cmp",
        },
        config = function()
            require("neoconf").setup()
            require("mason").setup({})
            require("mason-lspconfig").setup({})
			local blink_capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
				blink_capabilities
            )
            -- disable LSP snippets
            capabilities.textDocument.completion.completionItem.snippetSupport = false

            -- Set up capabilities automatically
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities
                        })
                    end,
                    -- clangd = function()
                    --     stuff
                    -- end
                }
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
					-- Neorg interim.ls stuff
					local bufnr = event.buf
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if not client then return end

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
					set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({async = true}) end, { desc = "Format", buffer = event.buf })
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
