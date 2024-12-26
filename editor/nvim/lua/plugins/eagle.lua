return {
	"soulis-1256/eagle.nvim",
	config = function()
		require("eagle").setup({
			keyboard_mode = true,
		})
	end,
	vim.keymap.set("n", "<Tab>", ":EagleWin<CR>", { noremap = true, silent = true }),
}
