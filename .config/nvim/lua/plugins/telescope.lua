return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup {
			defaults = {
				path_display = { "filename_first" },
				file_ignore_patterns = {
					"%.png$",
					"%.svg$",
					"%.jpg$",
					"%.jpeg$",
					"%.pdf"
				}
			},
		}
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>F', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope search help tags' })
		vim.keymap.set('n', '<leader>res', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope find symbols' })
		require('telescope').setup {}
	end
}
