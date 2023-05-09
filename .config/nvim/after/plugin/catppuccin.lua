local status, catppuccin = pcall(require, 'catppuccin')
if (not status) then return end

local telescopeBorderless = function(flavor)
    local cp = require("catppuccin.palettes").get_palette(flavor)

    return {
        TelescopeBorder = { fg = cp.surface0, bg = cp.surface0 },
        TelescopeSelectionCaret = { fg = cp.flamingo, bg = cp.surface1 },
        TelescopeMatching = { fg = cp.peach },
        TelescopeNormal = { bg = cp.surface0 },
        TelescopeSelection = { fg = cp.text, bg = cp.surface1 },
        TelescopeMultiSelection = { fg = cp.text, bg = cp.surface2 },

        TelescopeTitle = { fg = cp.crust, bg = cp.green },
        TelescopePreviewTitle = { fg = cp.crust, bg = cp.red },
        TelescopePromptTitle = { fg = cp.crust, bg = cp.mauve },

        TelescopePromptNormal = { fg = cp.flamingo, bg = cp.crust },
        TelescopePromptBorder = { fg = cp.crust, bg = cp.crust },
    }
end

catppuccin.setup({
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
    highlight_overrides = {
        latte = telescopeBorderless('latte'),
        frappe = telescopeBorderless('frappe'),
        macchiato = telescopeBorderless('macchiato'),
        mocha = telescopeBorderless('mocha'),
    },
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
        lsp_saga = true,
        which_key = true,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
