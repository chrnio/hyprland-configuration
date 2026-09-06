-- See https://wiki.hypr.land/Configuring/Basics/Variables/

local options = require("modules.options")

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,

		border_size = 2,

		col = {
			-- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			-- inactive_border = "rgba(595959aa)",
			active_border = { colors = { "rgba(7aa2f7ee)" } },
			inactive_border = "rgba(292e42ff)",
		},

		resize_on_border = true,

		-- Read https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before turning this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	-- The curves and per-leaf timings live in modules/animations, this only
	-- flips the master switch.
	animations = {
		enabled = options.animations.enabled,
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})
