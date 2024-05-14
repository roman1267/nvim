local opts = {
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
}

local config = function()
    require("core.utils").lazy_load("gitsigns", opts)
end

return config
