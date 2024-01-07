return {
   "NvChad/nvterm",
   lazy = true,
   keys = { "<M-i>", "<C-l>" },
   init = function()
      require("core.utils").load_mappings("nvterm")
   end,
   opts = {
      terminals = {
         shell = vim.o.shell,
         list = {},
         type_opts = {
            float = {
               relative = "editor",
               row = 0.15,
               col = 0.16,
               width = 0.68,
               height = 0.6,
               border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
         },
      },
      behavior = {
         autoclose_on_quit = {
            enabled = false,
            confirm = true,
         },
         close_on_exit = true,
         auto_insert = true,
      },
   },
   config = function(_, opts)
      require("core.utils").lazy_load("nvterm", opts)
   end,
}
