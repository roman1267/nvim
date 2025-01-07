--- NOTE: Show git signs and other git info
return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  ft = "gitcommit",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
}
