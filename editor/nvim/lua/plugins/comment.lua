return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				line = "<C-c>",
			},
			opleader = {
				line = "<C-c>",
			},
		})
	end,
}
