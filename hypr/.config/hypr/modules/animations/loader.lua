-- Loads exactly one file from modules/animations/profiles, picked by name in
-- modules/options.lua. Only the selected profile ever runs, so profiles never
-- bleed into each other.

local options = require("modules.options")

local FALLBACK = "default"

local config_home = os.getenv("XDG_CONFIG_HOME")
if config_home == nil or config_home == "" then
	config_home = os.getenv("HOME") .. "/.config"
end

local profile_dir = config_home .. "/hypr/modules/animations/profiles/"

-- The profiles are written for HyDE, which hands them a global "hyde" table and
-- reads the speed multiplier out of it. Instead of editing every file that gets
-- dropped in here, each profile is run with its own environment that carries a
-- stand-in for that table and falls through to the real globals for everything
-- else, hl included. That keeps upstream profiles usable byte for byte.
local function profile_env()
	local env = {
		hyde = {
			config = {
				anim = {
					duration_scale = options.animations.duration_scale,
				},
			},
		},
	}

	return setmetatable(env, { __index = _ENV })
end

local function load_profile(name)
	local chunk, err = loadfile(profile_dir .. name .. ".lua", "t", profile_env())
	if not chunk then
		return false, err
	end

	local ok, result = pcall(chunk)
	if not ok then
		return false, result
	end

	-- Some profiles return their metadata table, some return nothing at all.
	return true, result
end

if not options.animations.enabled then
	return
end

local name = options.animations.profile
local ok, err = load_profile(name)

if not ok then
	hl.log("hypr: animation profile '" .. name .. "' failed to load: " .. tostring(err))
	hl.notification.create({
		text = "Animation profile '" .. name .. "' failed to load, falling back to " .. FALLBACK,
		timeout = 8000,
	})

	if name ~= FALLBACK then
		load_profile(FALLBACK)
	end
end
