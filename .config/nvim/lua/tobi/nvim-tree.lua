local nvim_tree = require('nvim-tree')
local tree_config = require('nvim-tree.config')

tree_cb = tree_config.nvim_tree_callback

nvim_tree.setup {
	update_focused_file = {
		enable = true,
		update_root = true,
		update_cwd = true,
	},
	diagnostics = {
		enable = true,
	},
	view = {
		width = 30,
		side = 'left',
		mappings = {
			list = {
				{ key = { 'l', '<CR>', 'o' }, cb = tree_cb 'edit' },
				{ key = 'h', cb = tree_cb 'close_node' },
				{ key = 'v', cb = tree_cb 'vsplit' },
			}
		}
	},
}

