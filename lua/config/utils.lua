-- General Utilities
local M = {}

---loads all keymaps from the given section
---@param section string
M.load_mappings = function(section)
  local mappings = require("config.keymaps")
  -- Keymaps can be loaded with schedule without breaking anything
  vim.schedule(function()
    -- Iterate through all mappings in section
    for _, mapping in ipairs(mappings[section]) do
      vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
    end
  end)
end

return M
