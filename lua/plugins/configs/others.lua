local options = {}

options.comment = {

}

options.autopairs = {
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  disable_in_macro = false,         -- disable when recording or executing a macro
  disable_in_visualblock = false,   -- disable when insert after visual block mode
  disable_in_replace_mode = true,
  ignored_next_char = "[=[[%,w%%%'%[%\"%.%`%$]]=]",
  enable_moveright = true,
  enable_afterquote = true,           -- add bracket pairs after quote
  enable_check_bracket_line = true,   --- check bracket in same line
  enable_bracket_in_quote = true,     --
  enable_abbr = false,                -- trigger abbreviation
  break_undo = true,                  -- switch for basic rule break undo sequence
  check_ts = false,
  map_cr = true,
  map_bs = true,     -- map the <BS> key
  map_c_h = false,   -- Map the <C-h> key to delete a pair
  map_c_w = false,   -- map <c-w> to delete a pair if possible
}

options.blankline = {
  char = '┊',
  show_trailing_blankline_indent = false,
}
options.gitsigns = {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  }
}

options.gruvbox = {
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}

return options
