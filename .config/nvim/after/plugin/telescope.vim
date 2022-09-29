" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>
nnoremap <leader>fs <cmd>lua require'telescope.builtin'.git_status()<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lua << EOF
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
}
EOF

