package.path = "/home/romanm/.config/nvim/?.lua;" .. package.path

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- TODO: move to core.utils
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

local lazyopts = {
   change_detection = {
      -- automatically check for config file changes and reload the ui
      enabled = true,
      notify = false, -- get a notification when changes are found
   },
   defaults = { lazy = true },
}

require("core.settings")
require("lazy").setup("plugins", lazyopts)
require("core.keymaps")
require("core.autocmd")
