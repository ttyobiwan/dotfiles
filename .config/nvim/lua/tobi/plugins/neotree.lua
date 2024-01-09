return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		if vim.fn.argc(-1) == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	config = function ()
		require("neo-tree").setup({
			enable_git_status = false,
			enable_diagnostics = false,
			filesystem = {
				follow_current_file = {
					enabled = true
				}
			}
		})
		vim.api.nvim_set_keymap('n', '<leader>q', '<Cmd>Neotree<CR>', { noremap = true, silent = true })
	end
}
