vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<A-w>", "<C-w><CR>", { desc = "Save in normal mode" })
vim.keymap.set("i", "<A-w>", "<C-w><CR>", { desc = "Save in insert mode" })
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

vim.keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 7)
end)

vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

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

vim.keymap.set("n", "<Leader>rr", "<:Rest run<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Leader>rp", "<:Rest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>rl", "<:Rest last<CR>", { noremap = true, silent = true })
