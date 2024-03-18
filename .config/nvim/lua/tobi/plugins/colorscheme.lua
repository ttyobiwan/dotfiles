return {
	{ 
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				variant = "main", 
				styles = {
					bold = false,
					italic = false,
					transparency = false,
				},
				highlight_groups = {
					-- Comment = { fg = "#b7d0ae" }, -- lotusGreen3 from kanagawa
				},
			})
			-- vim.cmd.colorscheme("rose-pine")
		end
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require('kanagawa').setup({
				compile = false,             -- enable compiling the colorscheme
				undercurl = true,            -- enable undercurls
				commentStyle = { italic = false },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
				typeStyle = {},
				transparent = false,         -- do not set background color
				dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
				terminalColors = true,       -- define vim.g.terminal_color_{0,17}
				colors = {                   -- add/modify theme and palette colors
					theme = { wave = {}, lotus = {}, dragon = {}, all = {
						ui = {
							bg_gutter = "none"
						}
					} },
				},
				overrides = function(colors)
					return {
						Boolean = { bold = false },
						-- Comment = { fg = colors.palette.lotusGreen },
					}
				end,
				theme = "wave",              -- Load "wave" theme when 'background' option is not set
			})
			-- vim.cmd.colorscheme "kanagawa"
		end 
	},
	{
		'Mofiqul/vscode.nvim',
		config = function()
			require('vscode').setup({
				transparent = false,
				italic_comments = true,
				underline_links = true,
			})
			vim.cmd.colorscheme "vscode"
		end
	},
	{
		'sam4llis/nvim-tundra',
		config = function()
			-- vim.g.tundra_biome = 'arctic' -- 'arctic' or 'jungle'
			-- vim.cmd.colorscheme "tundra"
		end
	}
}
