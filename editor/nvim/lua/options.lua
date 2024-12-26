vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.splitright = true -- Configure how new splits should be opened
vim.opt.splitbelow = true -- Configure how new splits should be opened
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.o.autowriteall = true
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time. Displays which-key popup sooner
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<A-w>", "<C-w><CR>", { desc = "Save in normal mode" })
vim.keymap.set("i", "<A-w>", "<C-w><CR>", { desc = "Save in insert mode" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v
vim.keymap.set("n", "<A-b>", ":Neotree toggle<CR>", {})
vim.keymap.set("n", "<A-t>", ":terminal<CR>", {})
vim.keymap.set("n", "<leader>t", ":TransparentToggle<CR>", {})
vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", {})
vim.keymap.set("n", "<C-S-Tab>", ":bprev<CR>", {})
vim.keymap.set("n", "<A-d>", ":bdelete<CR>", {})
vim.keymap.set("n", "<C-'>", ":ToggleTerm<CR>", {})
vim.keymap.set("n", "%", "ggVG<leader>y", {})
-- vim.keymap.set('n', '<C-c>',':c')

vim.keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 7)
end)

vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

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
