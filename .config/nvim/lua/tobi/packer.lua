vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require('telescope').setup{
				path_display = {"shorten"}
			}
		end
	}

	use({
		'rose-pine/neovim',
		as = 'rose-pine'	
	})

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use("theprimeagen/harpoon")

	use("tpope/vim-fugitive")

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

	use("jay-babu/mason-null-ls.nvim")

	use("jose-elias-alvarez/null-ls.nvim")

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		config = function ()
			require("neo-tree").setup({
				enable_git_status = false,
				enable_diagnostics = false,
				filesystem = {
					follow_current_file = {
						enabled = true
					}
				}
			})
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use {
		"nvim-pack/nvim-spectre"
	}

	use {
		"github/copilot.vim"
	}

	use {
		'goolord/alpha-nvim',
		config = function ()
			require'alpha'.setup(require'alpha.themes.dashboard'.config)
		end
	}
end)
