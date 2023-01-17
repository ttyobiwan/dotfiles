local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'tanvirtin/monokai.nvim'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'akinsho/bufferline.nvim'

Plug 'akinsho/toggleterm.nvim'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

vim.call('plug#end')

