--- NOTE: Show git signs and other git info
return {
  "lewis6991/gitsigns.nvim",
  ft = "gitcommit",
  event = { "BufReadPost", "BufNewFile" },
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
