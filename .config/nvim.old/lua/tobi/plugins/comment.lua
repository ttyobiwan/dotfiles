return {
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
