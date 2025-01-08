vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true         -- Make line numbers default
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.mouse = "a"           -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.showmode = false      -- Don't show the mode, since it's already in the status line
vim.opt.breakindent = true    -- Enable break indent
vim.opt.undofile = true       -- Save undo history
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
vim.opt.updatetime = 250   -- Decrease update time
vim.opt.splitright = true  -- Configure how new splits should be opened
vim.opt.splitbelow = true  -- Configure how new splits should be opened
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.o.autowriteall = true
vim.opt.cursorline = true    -- Show which line your cursor is on
vim.opt.timeoutlen = 300     -- Decrease mapped sequence wait time. Displays which-key popup sooner
vim.opt.scrolloff = 10       -- Minimal number of screen lines to keep above and below the cursor.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.bo.formatexpr = ""
vim.bo.formatprg = "jq"
