local utils = {}
utils.load_mappings = function(section)
   local mappings = require("core/keymaps")
   vim.schedule(function()
      for _, mapping in ipairs(mappings[section]) do
         vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
      end
   end)
end

utils.lazy_load = function(plugin, opts)
   -- some plugins' lazy-loading does not work when scheduled
   if plugin ~= "nvim-tree" and plugin ~= "which-key" then
      vim.schedule(function()
         require(plugin).setup(opts)
      end)
   else
      require(plugin).setup(opts)
   end
end

utils.bootstrap_or_nil = function()
   local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

   -- TODO: move to core.utils
   if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
   end

   vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
end

return utils
