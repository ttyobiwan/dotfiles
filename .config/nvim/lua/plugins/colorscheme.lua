return {
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
		config = function()
			require('github-theme').setup({})
			vim.cmd('colorscheme github_dark')
		end,
	},
}
