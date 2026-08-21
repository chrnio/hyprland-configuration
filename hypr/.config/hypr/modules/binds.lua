-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local options = require("modules.options")

local Mod = options.mod
local programs = options.programs

hl.bind(Mod .. " + Return", hl.dsp.exec_cmd(programs.terminal))
hl.bind(Mod .. " + SHIFT + Return", hl.dsp.exec_cmd(programs.editor))
hl.bind(Mod .. " + N", hl.dsp.exec_cmd(programs.file_manager))
hl.bind(Mod .. " + SHIFT + F", hl.dsp.exec_cmd(programs.terminal .. " -e yazi"))
hl.bind(Mod .. " + D", hl.dsp.exec_cmd(programs.menu))
hl.bind(Mod .. " + B", hl.dsp.exec_cmd(programs.browser))
hl.bind(Mod .. " + SHIFT + V", hl.dsp.exec_cmd("pavucontrol"))
hl.bind(Mod .. " + SHIFT + X", hl.dsp.exec_cmd(programs.terminal .. " -e bluetui"))
hl.bind(Mod .. " + SHIFT + D", hl.dsp.exec_cmd("discord"))
hl.bind(Mod .. " + SHIFT + P", hl.dsp.exec_cmd(programs.terminal .. " -e btop"))
hl.bind(Mod .. " + Z", hl.dsp.exec_cmd("zeditor"))
hl.bind(Mod .. " + M", hl.dsp.exec_cmd("spotify-launcher"))

-- hl.bind returns a handle, so this one can be switched off at runtime with
-- closeWindowBind:set_enabled(false)
local closeWindowBind = hl.bind(Mod .. " + SHIFT + Q", hl.dsp.window.close())

-- pidof keeps a second hyprlock from stacking on top of the first
hl.bind(Mod .. "+ Backspace", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))

-- Waybar hides and shows itself on SIGUSR1, no restart involved
hl.bind(Mod .. " + W", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

hl.bind(
	Mod .. " + SHIFT + Delete",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(Mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(Mod .. " + P", hl.dsp.window.pseudo())
-- Moved off SUPER + SHIFT + J, that combination now moves a window downwards
hl.bind(Mod .. " + T", hl.dsp.layout("togglesplit"))
hl.bind(Mod .. " + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 2, action = "toggle" }))

hl.bind(Mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(Mod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(Mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(Mod .. " + l", hl.dsp.focus({ direction = "right" }))

-- CTRL drags the window instead of the focus. This lives on CTRL rather than
-- SHIFT because SUPER + SHIFT + L locks the screen.
hl.bind(Mod .. " + CTRL + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(Mod .. " + CTRL + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(Mod .. " + CTRL + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(Mod .. " + CTRL + l", hl.dsp.window.move({ direction = "right" }))

-- ALT swaps the two windows outright, which keeps the layout shape intact
hl.bind(Mod .. " + SHIFT + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(Mod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "down" }))
hl.bind(Mod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(Mod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))

hl.bind(Mod .. " + Tab", hl.dsp.window.cycle_next({ next = true }))
hl.bind(Mod .. " + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }))
hl.bind(Mod .. " + grave", hl.dsp.focus({ last = true }))

-- Hold the resize submap and nudge with hjkl, Escape or Return to leave
-- hl.define_submap("resize", function()
-- 	hl.bind("h", hl.dsp.window.resize({ x = -40, y = 0 }), { repeating = true })
-- 	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 40 }), { repeating = true })
-- 	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -40 }), { repeating = true })
-- 	hl.bind("l", hl.dsp.window.resize({ x = 40, y = 0 }), { repeating = true })
-- 	hl.bind("Escape", hl.dsp.submap("default"))
-- 	hl.bind("Return", hl.dsp.submap("default"))
-- end)
-- hl.bind(Mod .. " + R", hl.dsp.submap("resize"))
--
-- hl.bind(Mod .. " + comma", hl.dsp.focus({ monitor = "-" }))
-- hl.bind(Mod .. " + period", hl.dsp.focus({ monitor = "+" }))
-- hl.bind(Mod .. " + SHIFT + comma", hl.dsp.window.move({ monitor = "-", follow = true }))
-- hl.bind(Mod .. " + SHIFT + period", hl.dsp.window.move({ monitor = "+", follow = true }))
--
-- hl.bind(Mod .. " + ALT + C", hl.dsp.window.center())
-- hl.bind(Mod .. " + ALT + P", hl.dsp.window.pin({ action = "toggle" }))
-- hl.bind(Mod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
-- hl.bind(Mod .. " + G", hl.dsp.group.toggle())
-- hl.bind(Mod .. " + ALT + Tab", hl.dsp.group.next())

-- Mod plus a digit switches workspace, adding SHIFT drags the window along.
for i = 1, 10 do
	local key = i % 10
	hl.bind(Mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(Mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(Mod .. " + minus", hl.dsp.workspace.toggle_special("magic"))
hl.bind(Mod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(Mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(Mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(Mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Needs playerctl installed
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

return {
	closeWindowBind = closeWindowBind,
}
