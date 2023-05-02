require("catppuccin").setup({
    compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = true, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = true, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        mini = true,
        lsp_trouble = true,
        hop = true,
        treesitter = true,
        navic = {
            enabled = true,
            custom_bg = "NONE",
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
