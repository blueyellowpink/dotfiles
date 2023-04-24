call plug#begin("~/.local/share/nvim/plugged/")
Plug 'nvim-tree/nvim-web-devicons'
" Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'echasnovski/mini.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/trouble.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'phaazon/hop.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'
call plug#end()

lua require("init")
