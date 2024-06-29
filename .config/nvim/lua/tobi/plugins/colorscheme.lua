return {
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = function()
			require('kanagawa').setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = false, bold = false },
				statementStyle = { bold = false },
				typeStyle = {},
				transparent = false,
				dimInactive = false,
				terminalColors = true,
				overrides = function()
					return {
						Boolean = { bold = false },
					}
				end,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					}
				},
				theme = "dragon",
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus"
				},
			})
			vim.cmd.colorscheme "kanagawa"
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = false,
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
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
						-- style = "nvchad",
					},
				},
				color_overrides = {
					-- mocha = {
					-- base = "#1a1c2a",
					-- mantle = "#141620",
					-- crust = "#0e0f16",
					-- },

				},
			})
			vim.cmd.colorscheme "catppuccin"
		end
	}
}
