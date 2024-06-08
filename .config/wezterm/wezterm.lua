local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Theme
-- config.window_background_opacity = 0.8
-- config.color_scheme = 'Rosé Pine (Gogh)'
-- config.color_scheme = 'tokyonight_night'
config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
-- config.color_scheme = 'Kanagawa (Gogh)'

-- Font
config.font = wezterm.font 'Monaspace Neon'
config.font_size = 10
config.harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" }
-- config.font = wezterm.font 'BerkeleyMono Nerd Font'
-- config.font_size = 10.5
-- config.font = wezterm.font 'JetBrainsMono Nerd Font'
-- config.font_size = 10


-- Window/tab
config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
-- config.use_fancy_tab_bar = false

-- Size
config.initial_rows = 128
config.initial_cols = 256

-- Remaps
config.keys = {
	{
		key = 'S',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'A',
		mods = 'CTRL|SHIFT',
		action = act.ActivatePaneDirection 'Left',
	},
	{
		key = 'D',
		mods = 'CTRL|SHIFT',
		action = act.ActivatePaneDirection 'Right',
	},
	{
		key = 'H',
		mods = 'CTRL|SHIFT',
		action = act.AdjustPaneSize { 'Left', 10 },
	},
	{
		key = 'L',
		mods = 'CTRL|SHIFT',
		action = act.AdjustPaneSize { 'Right', 10 },
	},
}

return config
