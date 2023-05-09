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
        prompt_prefix = "   ",
        selection_caret = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
    },
    pickers = {
        file_files = {
            find_command = {'rg', '--files', '--hidden', '--glob', '!.git' },
            theme = 'dropdown'
        }
    },
}
