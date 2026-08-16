-- Needs grim, slurp and wl-clipboard installed.

local options = require("modules.options")

local Mod = options.mod

-- Quoted once here so a space in the path cannot split the command apart.
local dir = "'" .. options.screenshots.directory .. "'"
local filename = "file=" .. dir .. "/$(date +%Y-%m-%d_%H-%M-%S).png"

local function notify(message)
	return "hyprctl notify -1 2500 0 " .. message
end

-- slurp exits non-zero and prints nothing when the selection is cancelled, so
-- every chain below stops there instead of handing grim an empty geometry.
hl.bind(
	Mod .. " + SHIFT + S",
	hl.dsp.exec_cmd(
		"mkdir -p "
			.. dir
			.. ' && geom=$(slurp) && [ -n "$geom" ] && '
			.. filename
			.. ' && grim -g "$geom" "$file" && '
			.. notify('"Screenshot saved to $file"')
	)
)

hl.bind(
	Mod .. " + SHIFT + C",
	hl.dsp.exec_cmd(
		'geom=$(slurp) && [ -n "$geom" ] && grim -g "$geom" - | wl-copy --type image/png && '
			.. notify('"Screenshot copied to clipboard"')
	)
)

-- The active window bind reads its geometry straight from the Lua API, so there
-- is no hyprctl or jq call in the middle of the pipeline.
hl.bind(Mod .. " + SHIFT + W", function()
	local window = hl.get_active_window()
	if not window then
		hl.notification.create({ text = "No active window to capture", timeout = 2500, icon = "warning" })
		return
	end

	local at, size = window.at, window.size
	local x, y = at.x or at[1], at.y or at[2]
	local w, h = size.x or size[1], size.y or size[2]

	local geometry = string.format("%d,%d %dx%d", x, y, w, h)

	hl.exec_cmd(
		"mkdir -p "
			.. dir
			.. " && "
			.. filename
			.. " && grim -g '"
			.. geometry
			.. '\' "$file" && '
			.. notify('"Screenshot saved to $file"')
	)
end)
