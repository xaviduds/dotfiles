return {
	"SmiteshP/nvim-navic",
	config = function()
		require("nvim-navic").setup({
			lsp = { auto_attach = true },
		})
	end,
}
