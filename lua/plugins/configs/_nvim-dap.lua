local config = function()
    local dap, dapui = require("dap"), require("dapui")

    -------------------- dapui listeners --------------------
    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end

    -------------------- adapters --------------------
    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
        name = "lldb",
    }

    -------------------- configurations --------------------
    dap.configurations.rust = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.expand("%:p:h:s?src?target/debug/?"), "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
        },
    }

    dap.configurations.python = {
        {
            name = "Launch",
            type = "python",
            request = "launch",
            program = "${file}",
        },
    }
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
end

return function()
    vim.schedule(config)
end
