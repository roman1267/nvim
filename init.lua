package.path = "/home/romanm/.config/nvim/?.lua;" .. package.path

require("core.init")
require("core.keymaps")
require("core.autocmd")
require("extra")
