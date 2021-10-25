"p LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto-format
"autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

lua << EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

-- install python ls: npm i -g pyright
lspconfig.pyright.setup {
    capabilities = capabilities
}
-- install bash ls: npm i -g bash-language-server
lspconfig.bashls.setup {
    capabilities = capabilities
}
-- install cmake ls: pip install cmake-language-server
lspconfig.cmake.setup {
    capabilities = capabilities
}
-- install c/c++ ls: sudo pacman -S ccls
lspconfig.ccls.setup {
    capabilities = capabilities
}
EOF
