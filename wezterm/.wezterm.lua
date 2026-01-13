-- Call wezterm API
local wezterm = require("wezterm")

local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	-- The following line toggles fullscreen on the spawned window
	window:gui_window():toggle_fullscreen()
end)

-- Object to hold the config
local config = wezterm.config_builder()

--Add configurations below this--

config.font = wezterm.font("JetBrains Mono NFM")
config.font_size = 14

config.enable_tab_bar = false
config.term = "xterm-256color"
config.color_scheme = "Rapture"
config.window_padding = {
	left = 10,
	right = 2,
	top = 15,
	bottom = 0,
}
config.default_prog = { "tmux" }
config.enable_scroll_bar = true
-- Configuration ends here--

return config
