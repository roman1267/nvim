--- NOTE: Set up Debug Adapter Protocol Debuggers
return {
  "mfussenegger/nvim-dap",
  enabled = true,
  lazy = true,
  cmd = {
    "DapClearBreakpoints",
    "DapContinue",
    "DapDisconnect",
    "DapEval",
    "DapNew",
    "DapRestartFrame",
    "DapSetLogLevel",
    "DapShowLog",
    "DapStepInto",
    "DapStepOut",
    "DapStepOver",
    "DapTerminate",
    "DapToggleBreakpoint",
    "DapToggleRepl",
  },
  keys = {
    {
      "<leader>dt",
      function()
        return require("dap").terminate()
      end,
      { desc = "[D]ebug [T]erminate" },
    },
    {
      "<leader>dr",
      function()
        return require("dap").restart()
      end,
      { desc = "[D]ebug [R]estart" },
    },
    {
      "<leader>dbt",
      function()
        return require("dap").toggle_breakpoint()
      end,
      { desc = "[D]ebug [B]reakpoint [T]oggle" },
    },
    {
      "<leader>dbC",
      function()
        require("dap").set_breakpoint(vim.fn.input({ prompt = "Enter breakpoint condition: " }))
      end,
      { desc = "[D]ebug [B]reakpoint [C]onditional" },
    },
    {
      "<leader>dbl",
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input({ prompt = "Enter log message: " }))
      end,
      { desc = "[D]ebug [B]reakpoint [L]og" },
    },
    {
      "<leader>dbc",
      function()
        return require("dap").clear_breakpoints()
      end,
      { desc = "[D]ebug [B]reakpoint [c]lear (all)" },
    },
    {
      "<leader>dc",
      function()
        return require("dap").continue()
      end,
      { desc = "[D]ebug [C]ontinue" },
    },
    {
      "<leader>dso",
      function()
        vim.ui.input({ prompt = "Number of steps: " }, function(input)
          return require("dap").step_over({ count = input })
        end)
      end,
      { desc = "[D]ebug [S]tep [O]ver" },
    },
    {
      "<leader>dsi",
      function()
        vim.ui.input({ prompt = "Number of steps: " }, function(input)
          return require("dap").step_into({ count = input })
        end)
      end,
      { desc = "[D]ebug [S]tep [I]nto" },
    },
    {
      "<leader>dsc",
      function()
        return require("dap").run_to_cursor()
      end,
      { desc = "[D]ebug [S]tep to [C]ursor" },
    },
  },
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
  end,
}
