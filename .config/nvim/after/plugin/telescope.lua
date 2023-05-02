local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

local status, actions = pcall(require, 'telescope.actions')
if (not status) then return end

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ["t"] = actions.select_tab,
                ["o"] = actions.select_default,
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-k>"] = actions.preview_scrolling_up
            },
            i = {
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-k>"] = actions.preview_scrolling_up
            },
        },
    },
    pickers = {
        file_files = {
            find_command = {'rg', '--files', '--hidden', '--glob', '!.git' }
        }
    }
}
