local options = {}

options.programs = {
	terminal = "kitty",
	editor = "neovide",
	file_manager = "nautilus",
	menu = "rofi -show drun -theme ~/.config/rofi/config.rasi",
	browser = "librewolf",
}

options.mod = "SUPER"

options.screenshots = {
	directory = (os.getenv("HOME") or "") .. "/Pictures/Screenshots",
}

options.animations = {
	enabled = true,
	profile = "superfast",
	duration_scale = 1.0,
}

return options
