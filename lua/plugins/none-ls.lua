return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style=file", "--asume-filename=~/.clang-format" },
				}),
				-- require("none-ls.diagnostics.eslint_d"),
			},
		})
		vim.keymap.set("n", "<leader>nf", vim.lsp.buf.format, {})
	end,
}
