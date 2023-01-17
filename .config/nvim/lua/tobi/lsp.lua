local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({ 'pyright' })

lsp.configure('pyright', {
	settings = {
		python = {
			venvPath = './venv'
		}
	}
})

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', { })

null_ls.setup({
	on_attach = null_opts.on_attach,
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.flake8
	}
})

lsp.setup()

