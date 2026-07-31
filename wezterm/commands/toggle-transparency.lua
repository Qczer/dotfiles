local wezterm = require("wezterm")

local opacity_file = wezterm.config_dir .. "/opacity.txt"

local function get_saved_opacity()
	local file = io.open(opacity_file, "r")

	if file then
		local value = tonumber(file:read("*all"))
		file:close()

		return value or 1
	end

	return 1
end

local function save_opacity(value)
	local file = io.open(opacity_file, "w")
	file:write(tostring(value))
	file:close()
end

return {
	brief = "Toggle terminal transparency",
	icon = "md_circle_opacity",

	action = wezterm.action_callback(function(window, pane)
		local current = get_saved_opacity()

		local new = current == 0.8 and 1 or 0.8

		save_opacity(new)

		local overrides = window:get_config_overrides() or {}
		overrides.window_background_opacity = new

		window:set_config_overrides(overrides)
	end),
}
