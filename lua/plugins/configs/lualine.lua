-- ===== lualine-lsp-progress =====
-- Color for highlights
local colors = {
   black = "#262626",
   red = "#cc241d",
   green = "#98971a",
   yellow = "#d79921",
   blue = "#458588",
   magenta = "#b16286",
   aqua = "#689d6a",
   white = "#a89984",
}

local lsp_progress = {
   "lsp_progress",
   display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
   colors = {
      percentage = colors.aqua,
      title = colors.aqua,
      message = colors.aqua,
      spinner = colors.aqua,
      lsp_client_name = colors.magenta,
      use = true,
   },
   separators = {
      component = " ",
      progress = " | ",
      message = { pre = "(", post = ")", commenced = "In Progress", completed = "Completed" },
      percentage = { pre = "", post = "%% " },
      title = { pre = "", post = ": " },
      lsp_client_name = { pre = "[", post = "]" },
      spinner = { pre = "", post = "" },
   },
   timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
   spinner_symbols = { " ", " ", " ", " ", " ", " ", " ", " " },
}
local opts = {
   options = {
      icons_enabled = true,
      -- theme = 'catppuccin-macchiato',
      theme = "gruvbox",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
         statusline = {},
         winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
         statusline = 1000,
         tabline = 1000,
         winbar = 1000,
      },
   },
   sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename", lsp_progress },
      lualine_x = { "filetype", "encoding" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
   },
   inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
   },
   tabline = {},
   winbar = {},
   inactive_winbar = {},
   extensions = {},
}

local config = function()
   require("core.utils").lazy_load("lualine", opts)
end

return config
