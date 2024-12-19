return {
  "mfussenegger/nvim-dap",
  enabled = true,
  lazy = true,
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    -- Set default terminal to kitty
    dap.defaults.fallback.external_terminal = {
      command = "/usr/bin/kitty", -- Replace with your terminal emulator's path
      args = { "-e" }, -- Arguments to launch the terminal
    }
    ------------------ dapui listeners ------------------
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    -------------------- configurations --------------------
    dap.configurations.python = {
      {
        name = "Launch",
        type = "python",
        request = "launch",
        program = "${file}",
        -- console = "externalTerminal",
      },
    }
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    require("config.utils").load_mappings("nvim_dap")
  end,
}
