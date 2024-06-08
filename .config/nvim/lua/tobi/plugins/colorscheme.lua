return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		enabled = false,
		config = function()
			require('rose-pine').setup({
				variant = "main", -- auto, main, moon, or dawn
				styles = {
					bold = false,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd.colorscheme "rose-pine"
		end
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		config = function()
			require("tokyonight").setup({
				style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = false,
				terminal_colors = false,
				styles = {
					comments = { italic = true },
					keywords = { italic = false },
					sidebars = "normal", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
			vim.cmd.colorscheme "tokyonight"
		end
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = function()
			require('kanagawa').setup({
				theme = "wave", -- wave, dragon, lotus
				compile = false,
				undercurl = true,
				commentStyle = { italic = false },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
				typeStyle = {},
				transparent = false,
				dimInactive = false,
				terminalColors = true,
				colors = {
					theme = {
						wave = {},
						lotus = {},
						dragon = {},
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					},
				},
				overrides = function(_)
					return {
						Boolean = { bold = false },
					}
				end,
			})
			vim.cmd.colorscheme "kanagawa"
		end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = true,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",  -- latte, frappe, macchiato, mocha
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
				},
				no_italic = false,  -- Force no italic
				no_bold = false,    -- Force no bold
				no_underline = false, -- Force no underline
				styles = {          -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
				},
				default_integrations = true,
				integrations = {
					treesitter = true,
					telescope = {
						enabled = true,
						style = "nvchad",
					},
				},
			})
			vim.cmd.colorscheme "catppuccin"
		end
	}
}
