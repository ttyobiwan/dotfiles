local treesitter = require('nvim-treesitter')

treesitter.setup {
	ensure_installed = { 'python' },
	highlight = { enable = true },
	indent = { enable = true },
}

