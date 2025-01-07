--- NOTE: UI for seeing keybinds
return {
  "folke/which-key.nvim",
  dependencies = { "echasnovski/mini.nvim", "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    {
      "<leader>w",
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
    wk.add({ "<M-i>", desc = "Open floating term" })
    wk.add({ "<leader>b", group = "Buffer" })
    wk.add({ "<leader>t", group = "Tab" })
    wk.add({ "<leader>h", group = "Home" })
    wk.add({ "<leader>f", group = "Find" })
    -- Debug group
    wk.add({ "<leader>d", group = "Debug" })
    wk.add({ "<leader>ds", group = "Step" })
    wk.add({ "<leader>db", group = "Breakpoint" })
    wk.add({ "<leader>s", group = "Split" })
  end,
}
