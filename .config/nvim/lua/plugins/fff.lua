return {
	'dmtrKovalenko/fff.nvim',
	build = function()
	  require("fff.download").download_or_build_binary()
	end,
	lazy = false,
	keys = {
	  {
		"<leader>f",
		function() require('fff').find_files() end,
		desc = 'FFFind files',
	  }
	}
}
