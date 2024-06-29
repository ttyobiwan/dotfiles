local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Theme
-- config.color_scheme = 'Kanagawa (Gogh)'
config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'Rosé Pine (Gogh)'
-- config.window_background_opacity = 0.8

-- Font
-- config.font = wezterm.font 'Hack Nerd Font Mono'
-- config.font = wezterm.font 'BerkeleyMono Nerd Font'
-- config.font = wezterm.font 'SpaceMono Nerd Font Mono'
-- config.font = wezterm.font 'MonaspiceNe Nerd Font Mono'
-- config.harfbuzz_features = { 'calt', 'liga', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09' }
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.font_size = 13

-- Window/tab
config.enable_tab_bar = false
config.window_padding = {
	bottom = 0,
}

return config
