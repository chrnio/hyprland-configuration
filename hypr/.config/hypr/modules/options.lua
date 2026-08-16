local options = {}

options.programs = {
	terminal = "kitty",
	editor = "neovide",
	file_manager = "nautilus",
	menu = "fuzzel",
	browser = "librewolf",
}

options.mod = "SUPER"

options.screenshots = {
	directory = (os.getenv("HOME") or "") .. "/Pictures/Screenshots",
}

options.animations = {
	enabled = true,
	profile = "fast",
	duration_scale = 1.0,
}

return options
