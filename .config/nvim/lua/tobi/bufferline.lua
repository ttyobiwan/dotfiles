vim.opt.termguicolors = true

require('bufferline').setup {
	options = {
		offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
		close_command = 'bdelete! %d',
	},
}

