return {
	{
		'rmehri01/onenord.nvim',
		config = function()
			require('onenord').setup()
			vim.cmd('colorscheme onenord')
		end
	},
	{
		"navarasu/onedark.nvim",
		enabled = false,
		config = function()
			require('onedark').setup {
				style = 'darker' -- dark, darker, cool, deep, warm, warmer
			}
			require('onedark').load()
		end
	},
	{
		'projekt0n/github-nvim-theme',
		name = 'github-theme',
		enabled = false,
		config = function()
			require('github-theme').setup({})
			vim.cmd('colorscheme github_dark')
		end,
	},
}
