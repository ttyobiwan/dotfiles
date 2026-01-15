return {
	'dmtrKovalenko/fff.nvim',
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		debug = {
			enabled = true,
			show_scores = true,
		},
	},
	lazy = false,
	keys = {
		{
			"<leader>f",
			function() require('fff').find_files() end,
			desc = 'FFFind files',
		}
	},
	config = function()
		require('fff').setup({
			keymaps = {
				move_up = { '<Up>', '<Tab>' },
				move_down = { '<Down>', '<S-Tab>' },
				cycle_previous_query = '<C-p>',
				toggle_select = '<C-s>',
			},
		})
	end
}
