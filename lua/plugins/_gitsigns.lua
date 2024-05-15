return {
   "lewis6991/gitsigns.nvim",
   lazy = true,
   ft = "gitcommit",
   opts = {
      signs = {
         add = { text = "+" },
         change = { text = "~" },
         delete = { text = "_" },
         topdelete = { text = "‾" },
         changedelete = { text = "~" },
      },
   },
   config = function(_, opts)
      require("core.utils").lazy_load("gitsigns", opts)
   end,
}
