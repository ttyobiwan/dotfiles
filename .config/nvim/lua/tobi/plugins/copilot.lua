return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_enabled = false
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_filetypes = {markdown = true}
		vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	end
}
