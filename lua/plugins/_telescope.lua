return {
   "nvim-telescope/telescope.nvim",
   branch = "0.1.x",
   dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
   init = function()
      require("core/utils").load_mappings("telescope")
   end,
   lazy = true,
   cmd = { "Telescope", "TodoTelescope" },
   opts = {
      defaults = {
         mappings = {
            i = {
               ["<C-u>"] = false,
               ["<C-d>"] = false,
            },
         },
      },
   },

   config = function(_, opts)
      require("core.utils").lazy_load("telescope", opts)
   end,
}
