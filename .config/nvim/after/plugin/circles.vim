"circles.nvim
lua << EOF
require("circles").setup({
    icons = {
        empty = "",
        filled = "",
        lsp_prefix = ""
        },
    lsp = true
})
EOF
