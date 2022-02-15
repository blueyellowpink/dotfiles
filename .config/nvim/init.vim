" ~/.local/share/nvimplugged/ "

let g:polyglot_disabled = ['autoindent']

call plug#begin(has('nvim') ? stdpath('data') . 'plugged' : '~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'joshdick/onedark.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', {
\'do': 'yarn install',
\'for': ['javascript', 'json', 'markdown', 'html']
\}
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'b3nj5m1n/kommentary'
Plug 'phaazon/hop.nvim'

call plug#end()
runtime ./onedark.vim

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
set expandtab
"set smarttab
set updatetime=100

"set cursor line"
set cursorline
hi clear CursorLine
hi CursorLineNR guibg=#61afef guifg=#ffffff
" hi CursorLine gui=underline cterm=underline 
hi MatchParen gui=standout cterm=standout
"hi CursorLine gui=underline cterm=underline ctermfg=white guifg=white"

hi LineNr guifg=#abb2bf

hi TabLineFill guifg=#abb2bf
hi TabLine guifg=#abb2bf 
hi TabLineSel guifg=#ffffff guibg=#61afef

runtime ./maps.vim
