-- nvim-navic
local navic = require('nvim-navic')

navic.setup({
	highlight = true
})
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

-- LSP

local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup{
	on_attach = on_attach,
	cmd = { '/Users/archuser/.rustup/toolchains/stable-aarch64-apple-darwin/bin/rust-analyzer' }
}

lspconfig.pyright.setup{
	on_attach = on_attach
}
