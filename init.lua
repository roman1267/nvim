-- Require general settings first, then setup Lazy.nvim
require("config.settings")
require("config.lazy")

-- Load critical keybinds immediately
require("config.utils").load_mappings("global")
require("config.utils").load_mappings("buffers")
require("config.utils").load_mappings("splits")
require("config.utils").load_mappings("tabs")
