return {
	"nvim-lualine/lualine.nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' }, enabled = true,
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'base16',
				-- theme = 'palenight',
				globalstatus = false,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				always_divide_middle = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				}
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {
					'filename',            
					{
						"navic",
						color_correction = nil,
						navic_opts = nil
					}
				},
				lualine_x = {'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filename'},
				lualine_x = {'location'},
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {"neo-tree"}
		}
	end,
}
