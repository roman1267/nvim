--- NOTE: Easy terminal integration

local ft_cmds = {
  python = "python3 " .. vim.fn.expand("%"),
  rust = "bacon",
}

return {
  "NvChad/nvterm",
  opts = {},
  keys = {
    {
      "<M-m>",
      function()
        require("nvterm.terminal").send(ft_cmds[vim.bo.filetype])
      end,
      {
        noremap = true,
        silent = true,
        desc = "ft-specific term",
      },
    },
    {
      "<M-i>",
      function()
        require("nvterm.terminal").toggle("float")
      end,
      {
        noremap = true,
        silent = true,
        desc = "Toggle floating term",
      },
    },
  },
}
