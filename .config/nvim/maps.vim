" terminal remap, alias and custom keymap for terminal"
tnoremap <Esc> <C-\><C-n>
if (has('nvim'))
    autocmd TermOpen * set nonumber norelativenumber
endif
command Term execute "tabnew | term"
noremap <A-h> :-tabm<cr>
noremap <A-l> :+tabm<cr>
command WQ wq
command Wq wq
command WA wa
command Wa wa
command QA qa
command Qa qa
command W w
command Q q
