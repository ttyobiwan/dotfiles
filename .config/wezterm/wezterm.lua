local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- config.color_scheme = 'Vs Code Dark+ (Gogh)'
config.color_scheme = 'rose-pine'
-- config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'Kanagawa (Gogh)'

config.font = wezterm.font 'Berkeley Mono'
config.font_size = 10.0

config.window_background_opacity = 0.8

config.window_decorations = "TITLE | RESIZE"

config.use_fancy_tab_bar = false 

config.initial_rows = 64
config.initial_cols = 256 

return config
