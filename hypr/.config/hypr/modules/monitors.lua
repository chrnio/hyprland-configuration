-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- An empty output string is the catch-all rule, so every connected display gets
-- its preferred mode at an automatic position and scale.
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})
