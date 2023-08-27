return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect

			require("lsp-zero.settings").preset({})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Ensure that lsp-zero.setup() is called first.
			{ "neovim/nvim-lspconfig" },
			-- Snippet engine
			{ "L3MON4D3/LuaSnip" },
			-- Snipput library
			{ "rafamadriz/friendly-snippets" },
			-- Plugins for adding stuff to completion menu
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

			require("lsp-zero.cmp").extend()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero.cmp").action()

			-- Load friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				mapping = {
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
					["<Tab>"] = cmp_action.tab_complete(),
					["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
				},
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
			{ "williamboman/mason.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jay-babu/mason-null-ls.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			-- This is where all the LSP shenanigans will live

			local lspconfig = require("lspconfig")
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			local lsp = require("lsp-zero").preset()

			require("lsp-zero").ensure_installed({
				"tsserver",
				"eslint",
			})

			lsp.on_attach(function(client, nr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				-- lsp.default_keymaps({ buffer = bufnr })

        -- These three are set in trouble.lua to use the trouble window.
				-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = nr, desc = "Definition" })
				-- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = nr, desc = "Type definition" })
				-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = nr, desc = "References" })
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = nr, desc = "Declaration" })
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = nr, desc = "Implementation" })
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = nr, desc = "Signature help" })
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = nr, desc = "Rename" })
				vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { buffer = nr, desc = "Format" })
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = nr, desc = "Code action" })

				vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { buffer = nr, desc = "Open float" })
				vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { buffer = nr, desc = "Go to previous" })
				vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { buffer = nr, desc = "Go to next" })
			end)

			-- (Optional) Configure lua language server for neovim
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			lsp.setup()

			-- Setup null-ls and mason-null-ls to work automatically
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Here you can add tools not supported by mason.nvim
					-- make sure the source name is supported by null-ls
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
				},
			})

			-- See mason-null-ls.nvim's documentation for more details:
			-- https://github.com/jay-babu/mason-null-ls.nvim#setup
			require("mason-null-ls").setup({
				ensure_installed = nil,
				automatic_installation = false, -- You can still set this to `true`
				handlers = {
					-- Here you can add functions to register sources.
					-- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
					--
					-- If left empty, mason-null-ls will  use a "default handler"
					-- to register all sources
				},
			})
		end,
	},
}
