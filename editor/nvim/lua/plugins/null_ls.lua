return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.mypy,
				-- null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.nixfmt,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.pg_format,
				-- null_ls.builtins.diagnostics.eslint,
				-- null_ls.builtins.formatting.sqlfluff.with({
				-- 	extra_args = { "--dialect", "postgres" }, -- change to your dialect
				-- }),
				-- null_ls.builtins.formatting.sqruff,
				-- require("none-ls.diagnostics.eslint"),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
