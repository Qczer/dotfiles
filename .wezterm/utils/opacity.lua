local wezterm = require("wezterm")

local M = {}

local opacity_file = wezterm.config_dir .. "/opacity.txt"

function M.get_opacity()
	local file = io.open(opacity_file, "r")

	if file then
		local value = tonumber(file:read("*all"))
		file:close()

		return value or 1
	end

	return 1
end

function M.save_opacity(value)
	local file = io.open(opacity_file, "w")

	if file then
		file:write(tostring(value))
		file:close()
	end
end

return M
