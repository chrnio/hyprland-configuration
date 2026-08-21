-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local options = require("modules.options")

hl.on("hyprland.start", function()
	--hl.exec_cmd(options.programs.terminal)
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar & hyprpaper & ") --.. options.programs.browser)
end)
