local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- config.color_scheme = 'Vs Code Dark+ (Gogh)'
config.color_scheme = 'rose-pine'
-- config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'Rosé Pine (base16)'

config.font = wezterm.font 'Berkeley Mono'
config.font_size = 11.0

config.window_decorations = "TITLE | RESIZE"

config.use_fancy_tab_bar = false 

return config
