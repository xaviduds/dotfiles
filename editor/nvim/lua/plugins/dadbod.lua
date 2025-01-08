-- return {
-- 	-- Core plugins for database management
-- 	{
-- 		"tpope/vim-dadbod",
-- 	},
-- 	{
-- 		"kristijanhusak/vim-dadbod-ui",
-- 		dependencies = { "tpope/vim-dadbod" },
-- 		config = function()
-- 			-- Set the directory for saved queries
-- 			vim.g.db_ui_save_location = "~/.config/nvim/db_ui_queries"
--
-- 			-- Keybinding to toggle the database UI
-- 			vim.api.nvim_set_keymap("n", "<Leader>du", ":DBUIToggle<CR>", { noremap = true, silent = true })
-- 		end,
-- 	},
-- 	{
-- 		"kristijanhusak/vim-dadbod-completion",
-- 		dependencies = { "tpope/vim-dadbod" },
-- 	},
--
-- 	-- Optionally, an SQL formatter plugin
-- 	{
-- 		"junegunn/vim-easy-align", -- for formatting SQL queries
-- 		cmd = "EasyAlign",
-- 	},
--
-- 	-- Configuration for database connections
-- 	config = function()
-- 		vim.g.dadbod = {
-- 			connections = {
-- 				-- sqlite = "sqlite:///path/to/database.db",
-- 			},
-- 		}
-- 	end,
-- }
--
return {
	-- Core plugins for database management
	{
		"tpope/vim-dadbod",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod" },
		config = function()
			-- Set the directory for saved queries
			vim.g.db_ui_save_location = "~/.config/nvim/db_ui_queries"

			-- Define custom connections for the UI
			vim.g.dadbod_custom_connections = {
				["Postgres Local"] = "postgres://postgres:1@localhost:2000/newlince",
				["SQLite Demo"] = "sqlite:///path/to/database.db",
			}

			-- Keybinding to toggle the database UI
			vim.api.nvim_set_keymap("n", "<Leader>du", ":DBUIToggle<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = { "tpope/vim-dadbod" },
	},

	-- Optionally, an SQL formatter plugin
	{
		"junegunn/vim-easy-align", -- for formatting SQL queries
		cmd = "EasyAlign",
	},
}
