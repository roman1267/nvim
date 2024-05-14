local opts = {
    workspaces = {
        {
            name = "roman-obsidian",
            path = "/home/roman/OneDrive/Documents/roman-obsidian",
        },
    },
    follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ "xdg-open", url })
    end,
    ---@param opts {path: string, label: string, id: string|?}
    markdown_link_func = function(opts)
        -- Replace all spaces with %20 for cross-compatibility
        opts.path = string.gsub(opts.path, "%s", "%%20")
        return string.format("[%s](%s)", opts.label, opts.path)
    end,
}
local config = function()
    require("core.utils").lazy_load("obsidian", opts)
    vim.g.obsidian_loaded = true
end

return config
