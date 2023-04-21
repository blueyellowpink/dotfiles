" ~/.local/share/nvimplugged/ "

call plug#begin(has('nvim') ? stdpath('data') . 'plugged' : '~/.vim/plugged')
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

"runtime ./onedark.vim

au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif

"line number"
set number relativenumber
set nu rnu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"general"
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set cindent
" set expandtab
"set smarttab
set updatetime=100

"set cursor line"
set cursorline
hi clear CursorLine
hi CursorLineNR guibg=#61afef guifg=#ffffff
" hi CursorLine gui=underline cterm=underline
hi MatchParen gui=standout cterm=standout
" hi CursorLine gui=underline cterm=underline ctermbg=white guibg=white

hi LineNr guifg=#abb2bf
hi TabLineFill guifg=#abb2bf
hi TabLine guifg=#abb2bf
hi TabLineSel guifg=#ffffff guibg=#61afef

runtime ./maps.vim

lua require('auto_format')
