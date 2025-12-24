return {
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
