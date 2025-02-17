return {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = { "lua", "go", "python", "html", "heex", "elixir" },
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
