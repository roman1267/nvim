package.path = "/home/romanm/.config/nvim/?.lua;" .. package.path
require("core.settings")
require("core.utils").bootstrap_or_nil()
local lazyopts = {
   change_detection = {
      -- automatically check for config file changes and reload the ui
      enabled = true,
      notify = false, -- get a notification when changes are found
   },
   defaults = { lazy = true },
}
require("lazy").setup("plugins", lazyopts)
require("core.keymaps")
require("core.autocmd")
