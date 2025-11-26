return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup {
			defaults = {
				path_display = { "filename_first" },
				layout_config = {
					width = 0.75,
					height = 0.75,
				},
			},
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					theme = "dropdown",
					previewer = false,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						}
					}
				}
			}
		}
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>f', builtin.find_files, {})
		vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>b', builtin.buffers, {})
		vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>res', builtin.lsp_dynamic_workspace_symbols, {})
	end
}
