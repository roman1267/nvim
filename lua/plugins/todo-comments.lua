--- NOTE: Highlight code comments
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "TodoFzfLua",
    "TodoLocList",
    "TodoTelescope",
    "TodoTrouble",
    "TodoQuickFix",
  },
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      { desc = "Next todo comment" },
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      { desc = "Previous todo comment" },
    },
    {
      "<leader>ft",
      "<cmd>TodoTelescope<cr>",
      { desc = "[F]ind [T]odos" },
    },
  },
}
