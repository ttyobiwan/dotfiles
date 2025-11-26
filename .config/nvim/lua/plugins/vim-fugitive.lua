return {
	"tpope/vim-fugitive",
	keys = {
		{ '<leader>gs', function() vim.cmd('vertical rightbelow Git') end, desc = 'git fugitive' },
	},
}
