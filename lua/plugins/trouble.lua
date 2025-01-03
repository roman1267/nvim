--- NOTE: Find diagnostics quickly
return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xd",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
