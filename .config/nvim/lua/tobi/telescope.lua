local telescope = require('telescope')

telescope.setup {
	defaults = {
		path_display = { 'smart' },
		file_ignore_patterns = { 'venv/*' },	
	},
}

