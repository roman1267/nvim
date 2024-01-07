return {
   "mfussenegger/nvim-dap",
   lazy = true,
   event = "LspAttach",
   init = function()
      require("core.utils").load_mappings("nvim_dap")
   end,
   config = function()
      local dap = require("dap")

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
               return vim.fn.input({ "Path to executable: ", vim.fn.expand("%:p:h:s?src?target/debug/?"), "file" })
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
      require("dap-python").setup("/usr/bin/python")
   end,
}