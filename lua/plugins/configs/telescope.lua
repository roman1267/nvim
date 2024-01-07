local opts = {
   defaults = {
      mappings = {
         i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
         },
      },
   },
}

local config = function()
   require("core.utils").lazy_load("telescope", opts)
end

return config
