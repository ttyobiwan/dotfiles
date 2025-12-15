return {
	'f-person/git-blame.nvim',
	keys = {
		{ '<leader>gb', function() vim.cmd('GitBlameToggle') end, desc = 'Toggle git blame' },
	},
	config = function()
		vim.g.gitblame_enabled = 0
		vim.g.gitblame_display_virtual_text = 1
	end
}
