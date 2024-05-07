return {
	"tpope/vim-fugitive",
	dependencies = { 'f-person/git-blame.nvim' },
	keys = {
		{ '<leader>gs', function() vim.cmd('vertical rightbelow Git') end, desc = 'git fugitive' },
	},
	config = function()
		vim.g.gitblame_display_virtual_text = 0
	end
}
