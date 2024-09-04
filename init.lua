-- Require general settings first, then setup of Lazy
require("config.settings")
require("config.lazy")

-- Load critical keybinds directly
require("config.utils").load_mappings("global")
require("config.utils").load_mappings("buffers")
require("config.utils").load_mappings("splits")
require("config.utils").load_mappings("tabs")
