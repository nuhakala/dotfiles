return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { { "prettierd", "prettier" } },
					typescript = { { "prettierd", "prettier" } },
					c = { "clang_format" },
					cpp = { "clang_format" },
					-- ["*"] = { "codespell" },
				},
                formatters = {
                    clang_format = {
                        -- By default, use the linux kernel coding style
                        prepend_args = { "-style=file:/home/jaba/.vim/linux_kernel_coding_style.clang-format" },
                    }
                }
			})

			vim.keymap.set({ "n", "v", "x" }, "<leader>z", function()
				require("conform").format({ lsp_fallback = true })
				print("File formatted")
			end, { desc = "Format" })
		end,
	},
}
