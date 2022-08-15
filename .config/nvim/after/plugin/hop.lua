local status, hop = pcall(require, "hop")
if (not status) then return end

hop.setup()

vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1()<cr>", {})

vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_words({ inclusive_jump = true })<cr>", {})

vim.api.nvim_set_keymap('v', 'f', "<cmd>lua require'hop'.hint_words({ inclusive_jump = true })<cr>", {})

vim.api.nvim_set_keymap('o', 't', "<cmd>lua require'hop'.hint_char1()<cr>", {})
vim.api.nvim_set_keymap('o', 'T', "<cmd>lua require'hop'.hint_words()<cr>", {})

vim.api.nvim_set_keymap('v', 't', "<cmd>lua require'hop'.hint_words()<cr>", {})
