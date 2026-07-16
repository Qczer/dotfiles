local wezterm = require("wezterm")
local commands = require("commands")
local opacity = require("utils.opacity")

local config = wezterm.config_builder()

-- General
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 13
config.line_height = 1.1
config.default_prog = { "pwsh.exe" }

-- Colors
config.color_scheme = "tokyonight_night"
config.colors = {
	cursor_bg = "#7aa2f7",
	cursor_border = "#7aa2f7",
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Miscellaneous settings
config.max_fps = 160

-- Key bindings
config.keys = {
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

-- Custom commands
wezterm.on("augment-command-palette", function()
	return commands
end)

config.window_background_opacity = opacity.get_opacity()

return config
