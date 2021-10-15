""set runtimepath^=~/.vim runtimepath+=~/.vim/after
""let &packpath = &runtimepath
""source ~/.vimrc

" ~/.local/share/nvimplugged/ "
let g:polyglot_disabled = ['autoindent']
call plug#begin(has('nvim') ? stdpath('data') . 'plugged' : '~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', {
\'do': 'yarn install',
\'for': ['javascript', 'json', 'markdown', 'html']
\}
Plug 'jiangmiao/auto-pairs'

call plug#end()

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
set updatetime=100

"remap command"
nnoremap gm gM
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
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
    }
}
EOF

" Auto-start NERDTree when open Vim "
autocmd VimEnter * NERDTree | wincmd p | call lightline#update()
"show hidden files"
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"One Dark theme config"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))"
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
"endif"

syntax on
colorscheme onedark

let s:background = {"gui": "#272a36", "cterm": "235", "cterm16": "0"}
hi Normal guibg=s:background


"lightline.vim config"
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'one'
\}
set noshowmode

"rainbow bracket config"
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['lightmagenta', 'yellow', 'cyan', 'orange', 'green', 'lightblue'],
\	'ctermfgs': ['lightmagenta', 'yellow', 'cyan', 'green', 'lightblue']
\}


"indent line"
let g:indentLine_char_list = ['|']
"disable autoindent vim-polyglot"
let g:polyglot_disabled = ['autoindent']


" terminal remap, alias and custom keymap for terminal"
tnoremap <Esc> <C-\><C-n>
if (has('nvim'))
  autocmd TermOpen * set nonumber norelativenumber
endif
command Term execute "tabnew | terminal"
noremap <A-h> :-tabm<cr>
noremap <A-l> :+tabm<cr>


"set cursor line"
set cursorline
hi CursorLine gui=underline cterm=underline 
hi MatchParen gui=standout cterm=standout
"hi CursorLine gui=underline cterm=underline ctermfg=white guifg=white"


"vim prettier"
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#semi = 'false'
