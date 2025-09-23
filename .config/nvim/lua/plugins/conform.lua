return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					-- Clang style file configured below
					c = { "clang_format" },
					cpp = { "clang_format" },
					go = { "gofmt" },
					-- Global config in ~/.config/yamlfmt/.yamlfmt
					yaml = { "yamlfmt" },
					-- ["*"] = { "codespell" },
				},
				formatters = {
					clang_format = {
						-- By default, use the linux kernel coding style
						prepend_args = { "-style=file:/home/jaba/.vim/linux_kernel_coding_style.clang-format" },
					},
				},
				default_format_opts = {
					lsp_format = "fallback",
					stop_after_first = true,
					async = true,
				}
			})

			vim.keymap.set({ "n", "v", "x" }, "<leader>z", function()
				conform.format({
					lsp_format = "fallback",
					stop_after_first = true,
					async = true,
				}, function(err, did_edit)
					local formatters, use_lsp = conform.list_formatters_to_run()
					if #formatters == 0 and not use_lsp then
						print("No formatters will run")
					elseif use_lsp then
						print("File formatted by LSP")
					elseif err == nil then
						print("File formatted by", formatters[1].name)
					else
						print("Conform format error:", err)
					end
				end)
			end, { desc = "Format" })
		end,
	},
}
