local opts = {
    options = {
        mode = "buffers", -- 'buffers' or 'tabs'
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "none",
        close_command = function()
            vim.cmd("bp")
            vim.cmd("bd #")
        end, -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = false, -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
        indicator = {
            icon = "", -- this should be omitted if indicator style is not 'icon'
            style = "icon", --'icon' | 'indicator' | 'none'
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- luacheck: ignore 212
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end,
        -- custom_filter = function(buf_number, buf_numbers)
        --   -- filter out filetypes you don't want to see
        --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --     return true
        --   end
        --   -- filter out by buffer name
        --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --     return true
        --   end
        --   -- filter out based on arbitrary rules
        --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --     return true
        --   end
        --   -- filter out by it's index number in list (don't show first buffer)
        --   if buf_numbers[1] ~= buf_number then
        --     return true
        --   end
        -- end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer", -- string | function
                text_align = "center", -- "left" | "center" | "right"
                separator = false,
            },
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        -- get_element_icon = function(element)
        --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(opts.filetype, { default = false })
        --   return icon, hl
        -- end,
        get_element_icon = function(element)
            -- element consists of {filetype: string, path: string, extension: string, directory: string}
            -- This can be used to change how bufferline fetches the icon
            -- for an element e.g. a buffer or a tab.
            -- e.g.
            local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
        end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
        },
        sort_by = "insert_at_end",
    },
    highlights = {
        fill = {
            -- colors
            fg = "#928374",
            bg = "#262626",
        },
        -- offset_separator = {
        --   fg = '#665c54',
        --   bg = '#262626',
        -- },
    },
}
local config = function()
    require("core.utils").lazy_load("bufferline", opts)
end

return config
