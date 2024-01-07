-- Sets options for both nvim-lint and mason-nvim-lint
local linter_table = {
   json = { "jsonlint" },
   lua = { "luacheck" },
   bash = { "shellcheck" },
   python = { "pylint" },
   css = { "stylelint" },
}

local linters = {}
for _, linter in ipairs(linter_table) do
   table.insert(linters, linter)
end

return {
   "rshkarin/mason-nvim-lint",
   dependencies = "mfussenegger/nvim-lint",
   lazy = true,
   event = "LspAttach",
   config = function()
      require("lint").linters_by_ft = linter_table
      require("mason-nvim-lint").setup({
         ensure_installed = linters,
      })
      vim.api.nvim_create_autocmd({ "BufWritePost", "LspAttach" }, {
         group = vim.api.nvim_create_augroup("nvim-lint-group", { clear = true }),
         callback = function()
            require("lint").try_lint()
         end,
      })
   end,
}
