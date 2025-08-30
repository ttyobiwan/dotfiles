return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				transparent_background = false,
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
				},
				no_italic = false,
				no_bold = false,
				no_underline = false,
				default_integrations = true,
				integrations = {
					cmp = true,
					treesitter = true,
					telescope = { enabled = true, style = "nvchad" },
				}
			})
			vim.cmd.colorscheme "catppuccin"
		end
	},
	{
		'AlexvZyl/nordic.nvim',
		enabled = true,
		config = function()
			require('nordic').load()
		end
	}
}
