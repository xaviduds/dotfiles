return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			lsp = {
				code_actions = {
					previewer = "codeaction_native",
					preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS",
				},
			},
		})
	end,
}
