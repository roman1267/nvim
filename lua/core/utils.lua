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
return utils
