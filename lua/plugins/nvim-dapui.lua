--- NOTE: Fun UI for DAP Clients
return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  keys = {
    {
      "<leader>du",
      function()
        return require("dapui").toggle()
      end,
      { desc = "[D]ebug toggle [U]I" },
    },
  },
  config = function()
    require("dapui").setup()
  end,
}
