return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons', 'f-person/git-blame.nvim' },
		enabled = true,
		event = { "BufReadPost", "BufNewFile", "VeryLazy" },
		config = function()
			local git_blame = require('gitblame')
			vim.g.gitblame_display_virtual_text = 0
			vim.g.gitblame_message_template = '<author> • <date>'
			vim.g.gitblame_delay = 1000
			vim.g.gitblame_date_format = '%x'

			require('lualine').setup {
				options = {
					theme = 'auto',
					icons_enabled = true,
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
						},
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
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
}
