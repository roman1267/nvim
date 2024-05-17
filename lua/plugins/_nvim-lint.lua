-- *Sets options for both nvim-lint and mason-nvim-lint*

-- table of linters to be used by nvim-lint and auto-installed by mason-nvim-lint
local linter_table = {
   json = { "jsonlint" },
   lua = { "luacheck" },
   bash = { "shellcheck" },
   python = { "pylint" },
   css = { "stylelint" },
}

return {
   "rshkarin/mason-nvim-lint",
   dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
   lazy = false,
   event = "LspAttach",
   opts = {
      -- automatically install linters specified by nvim-lint
      automatic_installation = true,
   },
   config = function(_, opts)
      require("lint").linters_by_ft = linter_table
      require("mason-nvim-lint").setup(opts)
      vim.api.nvim_create_autocmd({ "BufWritePost", "LspAttach" }, {
         group = vim.api.nvim_create_augroup("nvim-lint-group", { clear = true }),
         callback = function()
            require("lint").try_lint()
         end,
      })
   end,
}
