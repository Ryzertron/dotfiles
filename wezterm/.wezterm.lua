-- Call wezterm API
local wezterm = require("wezterm")

-- Object to hold the config
local config = wezterm.config_builder()

--Add configurations below this--

config.font = wezterm.font("JetBrains Mono NFM")
config.font_size = 14

config.enable_tab_bar = false
config.term = "xterm-256color"
config.color_scheme = "Rapture"
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
config.default_prog = { "tmux" }
config.enable_scroll_bar = true
-- Configuration ends here--

return config
