return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = { "lua", "go", "python", "elixir" },
			sync_install = true,
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
