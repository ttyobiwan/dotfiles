-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Clipboard
vim.api.nvim_set_option('clipboard', 'unnamedplus')

-- Line numbers
vim.wo.relativenumber = true
vim.opt.number = true

-- Indents
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Folding
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 5
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.keymap.set("n", "<leader>c", "za", { desc = "Toggle fold", remap = true })
vim.keymap.set("n", "<leader>C", "zA", { desc = "Toggle full fold", remap = true })
vim.keymap.set(
	"n",
	"<leader>zz",
	function()
		local fcvalue = vim.api.nvim_win_get_option(0, "foldcolumn")
		if fcvalue == "0" then
			vim.cmd("set foldcolumn=9")
		else
			vim.cmd("set foldcolumn=0")
		end
	end,
	{ desc = "Add left margin", remap = true }
)

-- Buffers
vim.keymap.set("n", "<S-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<S-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<S-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<S-l>", "<C-w>l", { desc = "Go to right window", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
