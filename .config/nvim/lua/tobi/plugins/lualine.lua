return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
			},
			sections = {
				lualine_a = {
					{
						function()
							return ""
						end,
						padding = { left = 1, right = 0 },
						separator = "",
					},
					"mode",
				},
				lualine_c = { "filename" },
				lualine_x = { 'filetype' },
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", padding = { right = 1 } }
				}

			}
		}
	},
}
