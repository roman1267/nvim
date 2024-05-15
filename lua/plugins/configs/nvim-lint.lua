local linter_table = {
    json = { "jsonlint" },
    lua = { "luacheck" },
    bash = { "shellcheck" },
    python = { "pylint" },
    css = { "stylelint" },
}

local config = function()
    require("lint").linters_by_ft = linter_table
    require("mason-nvim-lint").setup()
    vim.api.nvim_create_autocmd({ "BufWritePost", "LspAttach" }, {
        group = vim.api.nvim_create_augroup("nvim-lint-group", { clear = true }),
        callback = function()
            vim.cmd(':silent! lua require("lint").try_lint()')
        end,
    })
end

return config
