-- nvim tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>")

vim.keymap.set("n", "<leader>th", ":-tabm<CR>")
vim.keymap.set("n", "<leader>tl", ":+tabm<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "gh", "^")
vim.keymap.set("n", "gl", "$")

vim.keymap.set("n", "Q", "<nop>") -- disable Q command

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- Esc in terminal

-- command
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WA", "wa", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("QA", "qa", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Term", "tabnew | terminal", {})

-- LSP Saga
vim.keymap.set("n", "grn", "<cmd>Lspsaga rename<CR>")
vim.keymap.set({"n", "v"}, "gca", "<cmd>Lspsaga code_action<CR>")
-- vim.keymap.set({"n", "t"}, "\\tt", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set({"n", "v"}, "gsd", "<cmd>Lspsaga lsp_finder<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
