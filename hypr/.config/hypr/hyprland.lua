-- Entry point. Everything below lives in modules/, edit those files instead of
-- this one. Settings you are likely to change often are in modules/options.lua.

-- Order matters here: monitors go first so rules and binds land on top of the
-- right output layout, and autostart goes last so processes only spawn once the
-- rest of the config is in place.
require("modules.monitors")
require("modules.environment")
require("modules.look-and-feel")
require("modules.animations.loader")
require("modules.input")
require("modules.rules")
require("modules.binds")
require("modules.screenshots")
require("modules.autostart")
