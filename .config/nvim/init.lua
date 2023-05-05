-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('editor')
require('remap')
require('term')
require('lazy').setup({
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin'
    },
    'echasnovski/mini.nvim',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'lewis6991/gitsigns.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'lukas-reineke/indent-blankline.nvim',
    'folke/trouble.nvim',
    'nvim-tree/nvim-tree.lua',
    'phaazon/hop.nvim',
    'feline-nvim/feline.nvim',
    'neovim/nvim-lspconfig',
    {
        "glepnir/lspsaga.nvim",
        lazy = true,
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                lightbulb = {
                    enable = false,
                    enable_in_insert = false,
                },
                ui = {
                    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
                },
            })
        end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            -- Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
    },
})
