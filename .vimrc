set number
set cursorline
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Auto-start NERDTree when open Vim "
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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


"lightline.vim config"
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one'
      \ }
set noshowmode


"auto pairs"
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


"rainbow bracket config"
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['lightmagenta', 'yellow', 'cyan', 'orange', 'green', 'lightblue'],
\	'ctermfgs': ['lightmagenta', 'yellow', 'cyan', 'green', 'lightblue']
\}

"indent line"
let g:indentLine_char_list = ['|']
