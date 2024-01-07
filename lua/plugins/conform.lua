return {
   "stevearc/conform.nvim",
   lazy = true,
   event = "VeryLazy",
   opts = {
      formatters_by_ft = {
         lua = { "stylua" },
         bash = { "beautysh" },
         sh = { "beautysh" },
         -- Conform will run multiple formatters sequentially
         -- python = { 'isort', 'black' },
         -- Use a sub-list to run only the first available formatter
         javascript = { { "prettierd", "prettier" } },
         css = { { "prettierd", "prettier" } },
         markdown = { { "prettierd", "prettier" } },
      },
      format_on_save = {
         -- These options will be passed to conform.format()
         timeout_ms = 500,
         lsp_fallback = true,
      },
   },
   config = function(_, opts)
      require("core.utils").lazy_load("conform", opts)
   end,
}
