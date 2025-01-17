-- Clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Save file
vim.keymap.set("n", "<A-w>", ":w<CR>", { desc = "Save in normal mode" })
vim.keymap.set("i", "<A-w>", "<Esc>:w<CR>a", { desc = "Save in insert mode" })

-- Move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down (normal)" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up (normal)" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down (visual)" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up (visual)" })

-- File navigation and management
vim.keymap.set("n", "<A-b>", ":Neotree toggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<A-t>", ":terminal<CR>", { desc = "Open terminal" })
vim.keymap.set("n", "<leader>t", ":TransparentToggle<CR>", { desc = "Toggle transparency" })
vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-S-Tab>", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<A-d>", ":bdelete<CR>", { desc = "Delete buffer" })

-- Preview and terminal split
vim.keymap.set(
	"n",
	"gp",
	"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	{ noremap = true, desc = "Go to preview definition" }
)
vim.keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 40)
end, { desc = "Open terminal in split" })

-- Run current file based on filetype
vim.keymap.set("n", "<Leader>rf", function()
	local filetype = vim.bo.filetype
	local filename = vim.fn.expand("%:p")

	local commands = {
		python = "python " .. filename,
		go = "go run " .. filename,
		lua = "lua " .. filename,
		javascript = "node " .. filename,
		typescript = "ts-node " .. filename,
		sh = "bash " .. filename,
	}

	local cmd = commands[filetype]

	if cmd then
		local output = vim.fn.system(cmd)

		if vim.v.shell_error ~= 0 then
			require("noice").notify("Error:\n" .. output, "error")
		else
			require("noice").notify("Success:\n" .. output, "info")
		end
	else
		require("noice").notify("No run command defined for filetype: " .. filetype, "warn")
	end
end, { noremap = true, silent = true, desc = "Run current file" })

-- REST client
vim.keymap.set("n", "<Leader>rr", ":RestRun<CR>", { noremap = true, silent = true, desc = "Run REST request" })
vim.keymap.set("n", "<Leader>rl", ":RestLast<CR>", { noremap = true, silent = true, desc = "Run last REST request" })

-- Sniprun keymaps
vim.keymap.set("n", "<Leader>rs", ":SnipRun<CR>", { noremap = true, silent = true, desc = "Run snippet" })
vim.keymap.set("v", "<Leader>rs", ":'<,'>SnipRun<CR>", { noremap = true, silent = true, desc = "Run snippet (visual)" })
vim.keymap.set("n", "<Leader>ra", "ggVG:SnipRun<CR>", { noremap = true, silent = true, desc = "Run entire file" })
vim.keymap.set("n", "<Leader>rt", function()
	local sniprun = require("sniprun.display")
	if sniprun.toggle_display ~= nil then
		sniprun.toggle_display()
		print("Sniprun: Toggled VirtualText")
	else
		print("Sniprun: Cannot toggle display")
	end
end, { noremap = true, silent = true, desc = "Toggle VirtualText" })
vim.keymap.set(
	"n",
	"<Leader>rc",
	":SnipClose<CR>:SnipReset<CR>",
	{ noremap = true, silent = true, desc = "Clear Sniprun output" }
)
vim.keymap.set("n", "<Leader>rrs", ":SnipReset<CR>", { noremap = true, silent = true, desc = "Reset Sniprun" })

vim.keymap.set("n", "<C-'>", ":ToggleTerm<CR>", { noremap = true, silent = true, desc = "ToggleTerm" })
