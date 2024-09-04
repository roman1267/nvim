return {
  "folke/which-key.nvim",
  dependencies = { "echasnovski/mini.nvim", "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps",
    },
  },
  config = function()
    require("which-key").setup()
    local wk = require("which-key")
    wk.add({
      "<leader>x",
      group = "Trouble",
    })
  end,
}
