vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use("theprimeagen/harpoon")

	-- use("mbbill/undotree")

	use("tpope/vim-fugitive")

	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup{
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			open_mapping = [[<c-/>]],
			persist_state = true,
			close_on_exit = true,
			direction = 'float',
			float_opts = {
				border = "curved",
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		}
	end}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup{
				ignore = '^$',
				toggler = {
					line = '<leader>/',
				},
				opleader = {
					line = '<leader>/',
				},
			}
		end
	}

	use("folke/zen-mode.nvim")
end)
