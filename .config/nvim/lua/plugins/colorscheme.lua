return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		config = function()
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				default_integrations = true,
				no_italic = true,
				no_bold = true,
			})
			vim.cmd([[colorscheme catppuccin]])
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = false,
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- main, moon, dawn
				styles = {
					bold = false,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd("colorscheme rose-pine")
		end
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		config = function()
			require("tokyonight").setup({
				style = "storm", -- night, storm, day, moon
			})
			vim.cmd [[colorscheme tokyonight]]
		end

	},
	{
		"navarasu/onedark.nvim",
		enabled = false,
		config = function()
			require('onedark').setup {
				style = 'cool' -- dark, darker, cool, deep, warm, warmer
			}
			require('onedark').load()
		end
	},
	{
		'projekt0n/github-nvim-theme',
		name = 'github-theme',
		lazy = false,
		priority = 1000,
		config = function()
			require('github-theme').setup({
			})

			vim.cmd('colorscheme github_dark')
		end,
	}
}
