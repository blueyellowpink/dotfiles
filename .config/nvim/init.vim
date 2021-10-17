""set runtimepath^=~/.vim runtimepath+=~/.vim/after
""let &packpath = &runtimepath
""source ~/.vimrc

" ~/.local/share/nvimplugged/ "
"let g:polyglot_disabled = ['autoindent']
call plug#begin(has('nvim') ? stdpath('data') . 'plugged' : '~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
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

"TreeSitter"

lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
EOF

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
lua << EOF


require('indent_blankline').setup {
    use_treesitter = true,
    show_current_context = true,
    show_end_of_line = true,
    context_patterns = {
        "class", "function", "method", "block", "arguments", 
        "^if", "^while", "^for", "^object", "^table",
        "abstract_class_declaration", "abstract_method_signature",
        "accessibility_modifier", "ambient_declaration", "arguments", "array",
        "array_pattern", "array_type", "arrow_function", "as_expression",
        "asserts", "assignment_expression", "assignment_pattern",
        "augmented_assignment_expression", "await_expression",
        "binary_expression", "break_statement", "call_expression",
        "call_signature", "catch_clause", "class", "class_body",
        "class_declaration", "class_heritage", "computed_property_name",
        "conditional_type", "constraint", "construct_signature",
        "constructor_type", "continue_statement", "debugger_statement",
        "declaration", "decorator", "default_type", "do_statement",
        "else_clause", "empty_statement", "enum_assignment", "enum_body",
        "enum_declaration", "existential_type", "export_clause",
        "export_specifier", "export_statement", "expression",
        "expression_statement", "extends_clause", "finally_clause",
        "flow_maybe_type", "for_in_statement", "for_statement",
        "formal_parameters", "function", "function_declaration",
        "function_signature", "function_type", "generator_function",
        "generator_function_declaration", "generic_type", "if_statement",
        "implements_clause", "import", "import_alias", "import_clause",
        "import_require_clause", "import_specifier", "import_statement",
        "index_signature", "index_type_query", "infer_type",
        "interface_declaration", "internal_module", "intersection_type",
        "jsx_attribute", "jsx_closing_element", "jsx_element", "jsx_expression",
        "jsx_fragment", "jsx_namespace_name", "jsx_opening_element",
        "jsx_self_closing_element", "labeled_statement", "lexical_declaration",
        "literal_type", "lookup_type", "mapped_type_clause",
        "member_expression", "meta_property", "method_definition",
        "method_signature", "module", "named_imports", "namespace_import",
        "nested_identifier", "nested_type_identifier", "new_expression",
        "non_null_expression", "object", "object_assignment_pattern",
        "object_pattern", "object_type", "omitting_type_annotation",
        "opting_type_annotation", "optional_parameter", "optional_type", "pair",
        "pair_pattern", "parenthesized_expression", "parenthesized_type",
        "pattern", "predefined_type", "primary_expression", "program",
        "property_signature", "public_field_definition", "readonly_type",
        "regex", "required_parameter", "rest_pattern", "rest_type",
        "return_statement", "sequence_expression", "spread_element",
        "statement", "statement_block", "string", "subscript_expression",
        "switch_body", "switch_case", "switch_default", "switch_statement",
        "template_string", "template_substitution", "ternary_expression",
        "throw_statement", "try_statement", "tuple_type",
        "type_alias_declaration", "type_annotation", "type_arguments",
        "type_parameter", "type_parameters", "type_predicate",
        "type_predicate_annotation", "type_query", "unary_expression",
        "union_type", "update_expression", "variable_declaration",
        "variable_declarator", "while_statement", "with_statement",
        "yield_expression"
    },
}
EOF


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
